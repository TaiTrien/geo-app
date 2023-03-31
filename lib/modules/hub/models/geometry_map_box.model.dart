class GeometryMapBox {
  GeometryMapBox({
    required this.coordinates,
    required this.type,
  });

  List<List<double>> coordinates;
  String type;

  factory GeometryMapBox.fromJson(Map<String, dynamic> json) => GeometryMapBox(
        coordinates:
            List<List<double>>.from(json["coordinates"].map((x) => List<double>.from(x.map((x) => x?.toDouble())))),
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "coordinates": List<dynamic>.from(coordinates.map((x) => List<dynamic>.from(x.map((x) => x)))),
        "type": type,
      };
}
