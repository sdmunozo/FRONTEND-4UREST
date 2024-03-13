import 'dart:convert';
import 'package:dasha/models/catalog.dart';

class CatalogsResponse {
  int total;
  List<Catalog> catalogs;

  CatalogsResponse({
    required this.total,
    required this.catalogs,
  });

  factory CatalogsResponse.fromRawJson(String str) =>
      CatalogsResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CatalogsResponse.fromJson(Map<String, dynamic> json) =>
      CatalogsResponse(
        total: json["total"],
        catalogs: List<Catalog>.from(
            json["catalogs"].map((x) => Catalog.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "total": total,
        "catalogs": List<dynamic>.from(catalogs.map((x) => x.toJson())),
      };
}