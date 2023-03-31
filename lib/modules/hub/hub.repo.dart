import 'package:flutter_config/flutter_config.dart';
import 'package:latlong2/latlong.dart';
import 'package:dio/dio.dart';
import './models/hub.models.dart';

class HubRepo {
  final Dio _dio = Dio();

  Future<RouteModel> getDirections(LatLng from, LatLng to) async {
    try {
      String url =
          "https://api.mapbox.com/directions/v5/mapbox/driving/${from.longitude}%2C${from.latitude}%3B${to.longitude}%2C${to.latitude}?alternatives=true&geometries=geojson&language=en&overview=simplified&steps=true&access_token=${FlutterConfig.get("MAPBOX_PK")}";
      final result = await _dio.get(url);
      if (result.statusCode == 200) {
        return RouteModel.fromJson(result.data);
      }
      return Future.error("Get routes failed");
    } catch (e) {
      throw Future.error(e);
    }
  }
}
