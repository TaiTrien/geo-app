class Properties {
  Properties({
    required this.id,
    required this.address,
    required this.postCode,
    required this.type,
    required this.state,
    required this.name,
    required this.displayName,
    required this.storeCount,
  });

  String id;
  String address;
  int postCode;
  String type;
  String state;
  String name;
  String displayName;
  int storeCount;

  factory Properties.fromJson(Map<String, dynamic> json) => Properties(
        id: json["id"],
        address: json["address"],
        postCode: json["post_code"],
        type: json["type"],
        state: json["state"],
        name: json["name"],
        displayName: json["display_name"],
        storeCount: json["store_count"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "address": address,
        "post_code": postCode,
        "type": type,
        "state": state,
        "name": name,
        "display_name": displayName,
        "store_count": storeCount,
      };
}
