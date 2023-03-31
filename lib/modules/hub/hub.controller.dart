import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:geo_app/modules/hub/hub.model.dart';
import 'package:geo_app/utils/toast.utils.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

class HubController extends GetxController {
  final RxList<Hub> _hubs = <Hub>[].obs;
  final RxMap<String, List<LatLng>> _pickupAreas = <String, List<LatLng>>{}.obs;

  set hubs(value) => _hubs.value = value;
  List<Hub> get hubs => _hubs;

  set pickupAreas(value) => _pickupAreas.value = value;
  Map<String, List<LatLng>> get pickupAreas => _pickupAreas;

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
}
