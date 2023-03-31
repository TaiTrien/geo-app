import 'package:geo_app/modules/hub/models/geometry_map_box.model.dart';

import 'hub.models.dart';

class RouteElement {
  RouteElement({
    required this.weightName,
    required this.weight,
    required this.duration,
    required this.distance,
    required this.geometry,
  });

  String weightName;
  double weight;
  double duration;
  double distance;
  GeometryMapBox geometry;

  factory RouteElement.fromJson(Map<String, dynamic> json) => RouteElement(
        weightName: json["weight_name"],
        weight: json["weight"]?.toDouble(),
        duration: json["duration"]?.toDouble(),
        distance: json["distance"]?.toDouble(),
        geometry: GeometryMapBox.fromJson(json["geometry"]),
      );

  Map<String, dynamic> toJson() => {
        "weight_name": weightName,
        "weight": weight,
        "duration": duration,
        "distance": distance,
        "geometry": geometry.toJson(),
      };
}
