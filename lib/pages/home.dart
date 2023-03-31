import 'dart:convert';
import 'dart:ffi';
import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:geo_app/modules/hub/hub.controller.dart';
import 'package:geo_app/services/location.service.dart';
import 'package:geo_app/utils/toast.utils.dart';
import 'package:get/get.dart';
import 'package:mapbox_gl/mapbox_gl.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State createState() => HomeState();
}

class HomeState extends State<Home> {
  MapboxMapController? mapController;
  final HubController _hubController = Get.find();
  static const LatLng _customerAddress = LatLng(-37.2561795, 143.6713972);

  @override
  void initState() {
    super.initState();
  }

  void _onMapCreated(MapboxMapController controller) {
    mapController = controller;
    navigateToCurrentLocation();
  }

  void navigateToCurrentLocation() {
    LocationServices.getCurrentLocation()
        .then((value) => {
              mapController?.animateCamera(
                CameraUpdate.newLatLngZoom(LatLng(value.latitude, value.longitude), 15),
              )
            })
        .onError((error, stackTrace) => ToastUtils.showError(error.toString()));
  }

  void loadCustomerAddress(MapboxMapController controller) {
    controller.addSymbol(const SymbolOptions(geometry: _customerAddress, iconImage: "airport-15"));
  }

  void _onStyleLoaded(MapboxMapController controller) async {
    loadCustomerAddress(controller);
    final fills = _hubController.getHubTileForFill();

    await controller.addGeoJsonSource("fills", fills);

    await controller.addLineLayer(
      "fills",
      "lines",
      LineLayerProperties(lineColor: Colors.red.toHexStringRGB(), lineWidth: 4),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MapboxMap(
        myLocationEnabled: true,
        myLocationTrackingMode: MyLocationTrackingMode.Tracking,
        trackCameraPosition: true,
        styleString: MapboxStyles.MAPBOX_STREETS,
        onStyleLoadedCallback: () => _onStyleLoaded(mapController!),
        accessToken: FlutterConfig.get('MAPBOX_SK'),
        onMapCreated: _onMapCreated,
        initialCameraPosition: const CameraPosition(target: LatLng(0, 0)),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).colorScheme.primary,
        onPressed: navigateToCurrentLocation,
        child: const Icon(Icons.location_searching),
      ),
    );
  }
}
