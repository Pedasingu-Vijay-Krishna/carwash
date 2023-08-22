// To parse this JSON data, do
//
//     final carModels = carModelsFromJson(jsonString);

import 'dart:convert';

Map<String, List<CarModels>> carModelsFromJson(String str) => Map.from(json.decode(str)).map((k, v) => MapEntry<String, List<CarModels>>(k, List<CarModels>.from(v.map((x) => CarModels.fromJson(x)))));

String carModelsToJson(Map<String, List<CarModels>> data) => json.encode(Map.from(data).map((k, v) => MapEntry<String, dynamic>(k, List<dynamic>.from(v.map((x) => x.toJson())))));

class CarModels {
  String? id;
  String company;
  String? carModel;
  String? carModelType;

  CarModels({
    this.id,
    required this.company,
    this.carModel,
    this.carModelType,
  });

  factory CarModels.fromJson(Map<String, dynamic> json) => CarModels(
    id: json["id"],
    company: json["company"],
    carModel: json["carModel"],
    carModelType: json["carModelType"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "company": company,
    "carModel": carModel,
    "carModelType": carModelType,
  };
}
