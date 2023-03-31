import 'dart:convert';
import 'dart:ffi';
import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:geo_app/modules/hub/hub.controller.dart';
import 'package:geo_app/modules/hub/hub.repo.dart';
import 'package:geo_app/services/location.service.dart';
import 'package:geo_app/utils/toast.utils.dart';
import 'package:geo_app/widgets/page_wrapper.dart';
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
  final LatLng _customerLocation = LatLng(-37.87502821530717, 145.16437548160567);
  LatLng _currentLocation = LatLng(0, 0);
  static const double _markerSize = 30;
  final String mapUrlTemplate =
      "https://api.mapbox.com/styles/v1/neirt/${FlutterConfig.get('MAPBOX_TEMPLATE_ID')}/tiles/256/{z}/{x}/{y}@2x?access_token=${FlutterConfig.get('MAPBOX_SK')}";

  @override
  void initState() {
    super.initState();
    _initLocations();
  }

  void _initLocations() {
    LocationServices.getCurrentLocation().then(
      (value) {
        LatLng current = LatLng(value.latitude, value.longitude);
        setState(() => _currentLocation = current);
        _hubController.getRoutesToCustomer(current, _customerLocation);
        _moveLocation(current);
      },
    ).onError((error, stackTrace) => ToastUtils.showError(error.toString()));
  }

  void _moveLocation(LatLng location) {
    _mapController.move(LatLng(location.latitude, location.longitude), 17);
  }

  @override
  Widget build(BuildContext context) {
    return PageWrapper(
      hasAppBar: true,
      title: "Geo map",
      body: FlutterMap(
        mapController: _mapController,
        options: MapOptions(
          zoom: 17,
          onMapReady: () => _initLocations(),
        ),
        children: [
          TileLayer(
            urlTemplate: mapUrlTemplate,
            userAgentPackageName: 'demo.geo-app',
          ),
          MarkerLayer(
            markers: [
              Marker(
                point: _currentLocation,
                width: _markerSize,
                height: _markerSize,
                builder: (context) => const Icon(Icons.location_history, size: _markerSize),
              ),
            ],
          ),
          MarkerLayer(
            markers: [
              Marker(
                point: _customerLocation,
                width: _markerSize,
                height: _markerSize,
                builder: (context) => const Icon(Icons.location_on, size: _markerSize),
              ),
            ],
          ),
          Obx(() => PolylineLayer(
                polylineCulling: false,
                polylines: _hubController.getPolylines(),
              )),
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
                .toList(),
          ),
        ],
      ),
      fab: FloatingActionButton(
        backgroundColor: Theme.of(context).colorScheme.primary,
        onPressed: () => _moveLocation(_currentLocation),
        child: const Icon(Icons.location_searching),
      ),
    );
  }
}
