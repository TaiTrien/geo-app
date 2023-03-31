import 'hub.models.dart';
import 'nearest_point_distance.model.dart';

class GeoHubTileDistance {
  GeoHubTileDistance({
    required this.poi,
    required this.nearestPointDistance,
  });

  Poi poi;
  NearestPointDistance nearestPointDistance;

  factory GeoHubTileDistance.fromJson(Map<String, dynamic> json) => GeoHubTileDistance(
        poi: Poi.fromJson(json["Poi"]),
        nearestPointDistance: NearestPointDistance.fromJson(json["NearestPointDistance"]),
      );

  Map<String, dynamic> toJson() => {
        "Poi": poi.toJson(),
        "NearestPointDistance": nearestPointDistance.toJson(),
      };
}
