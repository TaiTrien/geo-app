import 'dart:ffi';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:geo_app/services/location.service.dart';
import 'package:geo_app/utils/toast.utils.dart';
import 'package:geo_app/variants/variants.dart';
import 'package:get/get.dart';
import 'package:mapbox_gl/mapbox_gl.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State createState() => HomeState();
}

class HomeState extends State<Home> {
  MapboxMapController? mapController;
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
                CameraUpdate.newLatLngZoom(LatLng(value.latitude, value.longitude), 10),
              )
            })
        .onError((error, stackTrace) => ToastUtils.showError(error.toString()));
  }

  void loadCustomerAddress(MapboxMapController controller) {
    controller.addSymbol(const SymbolOptions(geometry: _customerAddress, iconImage: "airport-15"));
  }

  void _onStyleLoaded(MapboxMapController controller) {
    loadCustomerAddress(controller);
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
