import 'package:geo_app/modules/init/init.controller.dart';
import 'package:get/instance_manager.dart';

class InitBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(InitController(), permanent: true);
  }
}
