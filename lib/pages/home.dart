import 'dart:convert';
import 'dart:ffi';
import 'dart:io';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:geo_app/modules/hub/hub.controller.dart';
import 'package:geo_app/services/location.service.dart';
import 'package:geo_app/utils/toast.utils.dart';
import 'package:geo_app/variants/variants.dart';
import 'package:geojson/geojson.dart';
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
                CameraUpdate.newLatLngZoom(LatLng(-37.874157, 145.164177), 15),
              )
            })
        .onError((error, stackTrace) => ToastUtils.showError(error.toString()));
  }

  void loadCustomerAddress(MapboxMapController controller) {
    controller.addSymbol(const SymbolOptions(geometry: _customerAddress, iconImage: "airport-15"));
  }

  void _onStyleLoaded(MapboxMapController controller) async {
    loadCustomerAddress(controller);
    await controller.addGeoJsonSource("fills", _hubController.getFills());

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

const _points = {
  "type": "FeatureCollection",
  "features": [
    {
      "type": "Feature",
      "id": 2,
      "properties": {
        "type": "restaurant",
      },
      "geometry": {
        "type": "Point",
        "coordinates": [-37.883761, 145.054682]
      }
    },
    {
      "type": "Feature",
      "id": 3,
      "properties": {
        "type": "airport",
      },
      "geometry": {
        "type": "Point",
        "coordinates": [151.215730044667879, -33.874616048776858]
      }
    },
    {
      "type": "Feature",
      "id": 4,
      "properties": {
        "type": "bakery",
      },
      "geometry": {
        "type": "Point",
        "coordinates": [151.228803547973598, -33.892188026142584]
      }
    },
    {
      "type": "Feature",
      "id": 5,
      "properties": {
        "type": "college",
      },
      "geometry": {
        "type": "Point",
        "coordinates": [151.186470299174118, -33.902781145804774]
      }
    }
  ]
};
