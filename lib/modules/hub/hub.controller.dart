import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:geo_app/modules/hub/hub.model.dart';
import 'package:geo_app/utils/toast.utils.dart';
import 'package:get/get.dart';

class HubController extends GetxController {
  final RxList<Hub> _hubs = <Hub>[].obs;

  set hubs(value) => _hubs.value = value;
  List<Hub> get hubs => _hubs;

  @override
  void onInit() async {
    super.onInit();
    await loadHubsFromFile();
  }

  Future<void> loadHubsFromFile() async {
    try {
      final String response = await rootBundle.loadString('assets/data/data.json');
      List<Hub> jsonHubs = hubsFromStringJson(response);
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
      fills["features"].add(hub.geoHubTileDistance.poi.toJson());
    }
    return fills;
  }
}
