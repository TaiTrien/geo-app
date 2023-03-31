class PriorityScore {
  PriorityScore({
    required this.avgCourierScore,
    required this.avgShopperScore,
  });

  int avgCourierScore;
  int avgShopperScore;

  factory PriorityScore.fromJson(Map<String, dynamic> json) => PriorityScore(
        avgCourierScore: json["AvgCourierScore"],
        avgShopperScore: json["AvgShopperScore"],
      );

  Map<String, dynamic> toJson() => {
        "AvgCourierScore": avgCourierScore,
        "AvgShopperScore": avgShopperScore,
      };
}
