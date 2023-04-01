import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:geo_app/models/model_provider.dart';
import 'package:latlong2/latlong.dart';

class LocationRepo {
  Future<void> saveLocationToDB(LatLng newLocation) async {
    try {
      final Location data = Location(
        lat: newLocation.latitude,
        lng: newLocation.longitude,
      );
      // await Amplify.DataStore.save(data);
      final request = ModelMutations.create(data);
      final response = await Amplify.API.mutate(request: request).response;

      if (response.data == null) {
        safePrint('errors: ${response.errors}');
        return;
      }

      safePrint('Mutation result: ${response.data}');
    } on ApiException catch (e) {
      safePrint('Mutation failed: $e');
    }
  }
}
