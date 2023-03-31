class NearestPointDistance {
  NearestPointDistance({
    required this.latitude,
    required this.longitude,
    required this.nearestpointlongitude,
    required this.nearestpointlatitude,
    required this.distanceNearestPoint,
    required this.isError,
  });

  double latitude;
  double longitude;
  double nearestpointlongitude;
  double nearestpointlatitude;
  double distanceNearestPoint;
  bool isError;

  factory NearestPointDistance.fromJson(Map<String, dynamic> json) => NearestPointDistance(
        latitude: json["latitude"]?.toDouble(),
        longitude: json["longitude"]?.toDouble(),
        nearestpointlongitude: json["Nearestpointlongitude"]?.toDouble(),
        nearestpointlatitude: json["Nearestpointlatitude"]?.toDouble(),
        distanceNearestPoint: json["DistanceNearestPoint"]?.toDouble(),
        isError: json["IsError"],
      );

  Map<String, dynamic> toJson() => {
        "latitude": latitude,
        "longitude": longitude,
        "Nearestpointlongitude": nearestpointlongitude,
        "Nearestpointlatitude": nearestpointlatitude,
        "DistanceNearestPoint": distanceNearestPoint,
        "IsError": isError,
      };
}
