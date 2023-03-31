import 'package:geo_app/modules/hub/properties.model.dart';

import 'geometry.model.dart';

class Poi {
  Poi({
    required this.type,
    required this.geometry,
    required this.id,
    required this.properties,
  });

  String type;
  Geometry geometry;
  String id;
  Properties properties;

  factory Poi.fromJson(Map<String, dynamic> json) => Poi(
        type: json["type"],
        geometry: Geometry.fromJson(json["geometry"]),
        id: json["id"],
        properties: Properties.fromJson(json["properties"]),
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "geometry": geometry.toJson(),
        "id": id,
        "properties": properties.toJson(),
      };
}
