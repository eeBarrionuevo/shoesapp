class BrandModel {
  String name;
  bool status;

  BrandModel({
    required this.name,
    required this.status,
  });

  factory BrandModel.fromJson(Map<String, dynamic> json) => BrandModel(
        name: json["name"] ?? "",
        status: json["status"] ?? false,
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "status": status,
      };
}
