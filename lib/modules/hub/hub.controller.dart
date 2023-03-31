import 'package:flutter/services.dart';
import 'package:geo_app/modules/hub/hub.model.dart';
import 'package:geo_app/utils/toast.utils.dart';
import 'package:get/get.dart';

class HubController extends GetxController {
  final RxList<Hub> _hubs = <Hub>[].obs;
  final RxMap<String, List<List<double>>> _pickupLocations = <String, List<List<double>>>{}.obs;

  set hubs(value) => _hubs.value = value;
  List<Hub> get hubs => _hubs;

  set pickupLocations(value) => _pickupLocations.value = value;
  Map<String, List<List<double>>> get pickupLocations => _pickupLocations;

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
        List<List<double>> latLng = [];
        for (var coordinate in hub.geoHubTileDistance.poi.geometry.coordinates[0]) {
          latLng.add(coordinate);
        }
        pickupLocations[hub.geoHubTileDistance.poi.id] = latLng;
      }
      hubs = jsonHubs;
    } catch (e) {
      ToastUtils.showError(e.toString());
    }
  }

  Map<String, dynamic> getFills() {
    Map<String, dynamic> fills = {
      "type": "FeatureCollection",
      "features": [],
    };
    for (var hub in hubs) {
      fills["features"].add({
        "type": "Feature",
        "id": hub.geoHubTileDistance.poi.id,
        "geometry": {
          "type": "Polygon",
          "coordinates": [pickupLocations[hub.geoHubTileDistance.poi.id]],
        }
      });
    }
    return fills;
  }
}
