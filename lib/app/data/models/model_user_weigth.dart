

import 'dart:convert';

List<ModelUserWeigth> modelUserWeigthFromJson(String str) => List<ModelUserWeigth>.from(json.decode(str).map((x) => ModelUserWeigth.fromJson(x)));

String modelUserWeigthToJson(List<ModelUserWeigth> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));


class ModelUserWeigth {
    ModelUserWeigth({
        this.beratBadan,
        this.tanggal,
    });

    double? beratBadan;
    String? tanggal;

    factory ModelUserWeigth.fromJson(Map<String, dynamic> json) => ModelUserWeigth(
        beratBadan: json["berat_badan"].toDouble(),
        tanggal: json["tanggal"],
    );

    Map<String, dynamic> toJson() => {
        "berat_badan": beratBadan,
        "tanggal": tanggal,
    };
}