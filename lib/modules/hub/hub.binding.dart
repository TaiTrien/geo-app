import 'package:geo_app/modules/hub/hub.controller.dart';
import 'package:get/get.dart';

class HubBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(HubController());
  }
}
