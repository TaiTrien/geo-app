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
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State createState() => HomeState();
}

class HomeState extends State<Home> {
  final MapController _mapController = MapController();
  final HubController _hubController = Get.find();
  final LatLng _customerAddress = LatLng(-37.87502821530717, 145.16437548160567);
  final String mapUrlTemplate =
      "https://api.mapbox.com/styles/v1/neirt/${FlutterConfig.get('MAPBOX_TEMPLATE_ID')}/tiles/256/{z}/{x}/{y}@2x?access_token=${FlutterConfig.get('MAPBOX_SK')}";

  @override
  void initState() {
    super.initState();
  }

  // void _onMapCreated(MapboxMapController controller) {
  //   mapController = controller;
  //   navigateToCurrentLocation();
  // }

  void navigateToCurrentLocation() {
    LocationServices.getCurrentLocation()
        .then(
          (value) => {
            _mapController.move(
              LatLng(value.latitude, value.longitude),
              17,
            ),
          },
        )
        .onError((error, stackTrace) => ToastUtils.showError(error.toString()));
  }

  // void loadCustomerAddress(MapboxMapController controller) {
  //   controller.addSymbol(const SymbolOptions(geometry: _customerAddress, iconImage: "airport-15"));
  // }

  // void _onStyleLoaded(MapboxMapController controller) async {
  //   loadCustomerAddress(controller);
  //   await initPickAreas(controller);
  //   await test(controller);
  // }

  // Future<void> initPickAreas(MapboxMapController controller) async {
  //   final fills = _hubController.getHubTileForFill();
  //   await controller.addGeoJsonSource("fills", fills);
  //   await controller.addLineLayer(
  //     "fills",
  //     "lines",
  //     LineLayerProperties(lineColor: Colors.red.toHexStringRGB(), lineWidth: 4),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FlutterMap(
        mapController: _mapController,
        options: MapOptions(
          zoom: 17,
          onMapReady: () => navigateToCurrentLocation(),
        ),
        children: [
          TileLayer(
            urlTemplate: mapUrlTemplate,
            userAgentPackageName: 'demo.geo-app',
          ),
          PolygonLayer(
              polygons: _hubController.pickupAreas.keys
                  .map(
                    (e) => Polygon(
                      points: _hubController.pickupAreas[e] as List<LatLng>,
                      isFilled: false, // By default it's false
                      borderColor: Colors.red,
                      borderStrokeWidth: 4,
                    ),
                  )
                  .toList()),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).colorScheme.primary,
        onPressed: navigateToCurrentLocation,
        child: const Icon(Icons.location_searching),
      ),
    );
  }
}
