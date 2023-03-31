import 'dart:convert';
import 'package:geo_app/modules/hub/priority.model.dart';
import 'geo_hub_tile_distance.model.dart';

List<Hub> hubsFromStringJson(String str) => List<Hub>.from(json.decode(str).map((x) => Hub.fromJson(x)));

String hubsToJson(List<Hub> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Hub {
  Hub({
    required this.rangeKm,
    required this.latitude,
    required this.longitude,
    required this.geoHubTileDistance,
    required this.countOrders,
    required this.countNotAssignedOrders,
    required this.countCouriers,
    required this.countCourierShoppers,
    required this.countShoppers,
    required this.priorityScore,
  });

  int rangeKm;
  double latitude;
  double longitude;
  GeoHubTileDistance geoHubTileDistance;
  int countOrders;
  int countNotAssignedOrders;
  int countCouriers;
  int countCourierShoppers;
  int countShoppers;
  PriorityScore priorityScore;

  factory Hub.fromJson(Map<String, dynamic> json) => Hub(
        rangeKm: json["RangeKm"],
        latitude: json["Latitude"]?.toDouble(),
        longitude: json["Longitude"]?.toDouble(),
        geoHubTileDistance: GeoHubTileDistance.fromJson(json["GeoHubTileDistance"]),
        countOrders: json["CountOrders"],
        countNotAssignedOrders: json["CountNotAssignedOrders"],
        countCouriers: json["CountCouriers"],
        countCourierShoppers: json["CountCourierShoppers"],
        countShoppers: json["CountShoppers"],
        priorityScore: PriorityScore.fromJson(json["PriorityScore"]),
      );

  Map<String, dynamic> toJson() => {
        "RangeKm": rangeKm,
        "Latitude": latitude,
        "Longitude": longitude,
        "GeoHubTileDistance": geoHubTileDistance.toJson(),
        "CountOrders": countOrders,
        "CountNotAssignedOrders": countNotAssignedOrders,
        "CountCouriers": countCouriers,
        "CountCourierShoppers": countCourierShoppers,
        "CountShoppers": countShoppers,
        "priorityScore": priorityScore.toJson(),
      };
}
