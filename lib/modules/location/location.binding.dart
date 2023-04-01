import 'package:geo_app/modules/location/location.controller.dart';
import 'package:geo_app/modules/location/location.repo.dart';
import 'package:get/instance_manager.dart';

class LocationBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(LocationController(repo: LocationRepo()));
  }
}
