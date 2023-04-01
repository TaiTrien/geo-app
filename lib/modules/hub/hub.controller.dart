import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geo_app/modules/hub/hub.repo.dart';
import 'package:geo_app/utils/toast.utils.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

import 'models/hub.models.dart';

class HubController extends GetxController {
  final HubRepo _repo;
  HubController({required repo}) : _repo = repo;

  final RxList<Hub> _hubs = <Hub>[].obs;
  final RxMap<String, List<LatLng>> _pickupAreas = <String, List<LatLng>>{}.obs;
  final Rx<RouteModel> _toCustomerRoutes = RouteModel(code: '', routes: [], uuid: '').obs;

  set hubs(value) => _hubs.value = value;
  List<Hub> get hubs => _hubs;

  set pickupAreas(value) => _pickupAreas.value = value;
  Map<String, List<LatLng>> get pickupAreas => _pickupAreas;

  set toCustomerRoutes(value) => _toCustomerRoutes.value = value;
  RouteModel get toCustomerRoutes => _toCustomerRoutes.value;

  @override
  void onInit() async {
    super.onInit();
    await loadHubsFromFile();
  }

  Future<void> loadHubsFromFile() async {
    try {
      final String response = await rootBundle.loadString('assets/data/data.json');
      List<Hub> jsonHubs = hubsFromStringJson(response);
      for (var hub in jsonHubs) {
        List<LatLng> latLng = [];
        for (var coordinate in hub.geoHubTileDistance.poi.geometry.coordinates[0]) {
          latLng.add(LatLng(coordinate[1], coordinate[0]));
        }
        pickupAreas[hub.geoHubTileDistance.poi.id] = latLng;
      }
      hubs = jsonHubs;
    } catch (e) {
      ToastUtils.showError(e.toString());
    }
  }

  Future<void> getRoutesToCustomer(LatLng current, LatLng customer) async {
    try {
      RouteModel res = await _repo.getDirections(current, customer);
      toCustomerRoutes = res;
    } catch (e) {
      ToastUtils.showError(e.toString());
    }
  }

  getPolylines() {
    return toCustomerRoutes.routes
        .map(
          (route) => Polyline(
            points: route.geometry.coordinates.map((coord) => LatLng(coord[1], coord[0])).toList(),
            color: Colors.blue,
            strokeWidth: 4,
          ),
        )
        .toList();
  }
}
