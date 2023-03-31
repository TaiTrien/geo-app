// To parse this JSON data, do
//
//     final route = routeFromJson(jsonString);

import 'dart:convert';

import 'hub.models.dart';

RouteModel routeFromJson(String str) => RouteModel.fromJson(json.decode(str));

String routeToJson(RouteModel data) => json.encode(data.toJson());

class RouteModel {
  RouteModel({
    required this.routes,
    required this.code,
    required this.uuid,
  });

  List<RouteElement> routes;
  String code;
  String uuid;

  factory RouteModel.fromJson(Map<String, dynamic> json) => RouteModel(
        routes: List<RouteElement>.from(json["routes"].map((x) => RouteElement.fromJson(x))),
        code: json["code"],
        uuid: json["uuid"],
      );

  Map<String, dynamic> toJson() => {
        "routes": List<dynamic>.from(routes.map((x) => x.toJson())),
        "code": code,
        "uuid": uuid,
      };
}

enum DrivingSide { left, straight, right }

final drivingSideValues =
    EnumValues({"left": DrivingSide.left, "right": DrivingSide.right, "straight": DrivingSide.straight});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
