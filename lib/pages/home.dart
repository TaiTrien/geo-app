import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:geo_app/services/location.service.dart';
import 'package:get/get.dart';
import 'package:mapbox_gl/mapbox_gl.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State createState() => HomeState();
}

class HomeState extends State<Home> {
  MapboxMapController? mapController;

  @override
  void initState() {
    super.initState();
  }

  _onMapCreated(MapboxMapController controller) {
    mapController = controller;
    LocationServices.getCurrentLocation()
        .then((value) => {
              mapController?.animateCamera(
                CameraUpdate.newLatLngZoom(LatLng(value.latitude, value.longitude), 17),
              )
            })
        .catchError((error, stackTrace) {
      log(error);
    });
    ;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: MapboxMap(
      myLocationEnabled: true,
      myLocationTrackingMode: MyLocationTrackingMode.Tracking,
      trackCameraPosition: true,
      styleString: MapboxStyles.MAPBOX_STREETS,
      accessToken: FlutterConfig.get('MAPBOX_SK'),
      onMapCreated: _onMapCreated,
      initialCameraPosition: const CameraPosition(target: LatLng(0, 0)),
    ));
  }
}
