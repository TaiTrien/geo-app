import 'package:geo_app/modules/location/location.repo.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

import '../../utils/toast.utils.dart';

class LocationController extends GetxController {
  final LocationRepo _repo;
  LocationController({required LocationRepo repo}) : _repo = repo;

  Future<void> saveNewLocation(LatLng newLocation) async {
    try {
      _repo.saveLocationToDB(newLocation);
    } catch (e) {
      ToastUtils.showError(e.toString());
    }
  }
}
