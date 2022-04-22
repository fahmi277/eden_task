// To parse this JSON data, do
//
//     final modelMenus = modelMenusFromJson(jsonString);

import 'dart:convert';

Map<String, ModelMenus> modelMenusFromJson(String str) =>
    Map.from(json.decode(str))
        .map((k, v) => MapEntry<String, ModelMenus>(k, ModelMenus.fromJson(v)));

String modelMenusToJson(Map<String, ModelMenus> data) => json.encode(
    Map.from(data).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())));

class ModelMenus {
  ModelMenus({
    this.beratBadan,
    this.tanggal,
  });

  double? beratBadan;
  String? tanggal;

  factory ModelMenus.fromJson(Map<String, dynamic> json) => ModelMenus(
        beratBadan: json["berat_badan"].toDouble(),
        tanggal: json["tanggal"],
      );

  Map<String, dynamic> toJson() => {
        "berat_badan": beratBadan,
        "tanggal": tanggal,
      };
}
