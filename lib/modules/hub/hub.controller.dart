import 'dart:convert';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:geo_app/modules/hub/hub.model.dart';
import 'package:geo_app/utils/toast.utils.dart';
import 'package:get/get.dart';

class HubController extends GetxController {
  final RxList<Hub> _hubs = <Hub>[].obs;

  set hubs(value) => _hubs.value = value;
  get hubs => _hubs;

  @override
  void onInit() {
    super.onInit();
    loadHubsFromFile();
  }

  void loadHubsFromFile() async {
    try {
      final String response = await rootBundle.loadString('assets/data/data.json');
      List<Hub> jsonHubs = hubsFromStringJson(response);
      hubs = jsonHubs;
    } catch (e) {
      ToastUtils.showError(e.toString());
    }
  }
}
