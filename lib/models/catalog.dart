import 'dart:convert';

class Catalog {
  String id;
  String name;
  String description;
  bool isActive;
  bool isScheduleActive;
  int sort;
  dynamic icon;

  Catalog({
    required this.id,
    required this.name,
    required this.description,
    required this.isActive,
    required this.isScheduleActive,
    required this.sort,
    required this.icon,
  });

  factory Catalog.fromRawJson(String str) => Catalog.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Catalog.fromJson(Map<String, dynamic> json) => Catalog(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        isActive: json["isActive"],
        isScheduleActive: json["isScheduleActive"],
        sort: json["sort"],
        icon: json["icon"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "isActive": isActive,
        "isScheduleActive": isScheduleActive,
        "sort": sort,
        "icon": icon,
      };
}
