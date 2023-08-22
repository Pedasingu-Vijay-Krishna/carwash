// To parse this JSON data, do
//
//     final addUserCarResponse = addUserCarResponseFromJson(jsonString);

import 'dart:convert';

AddUserCarResponse addUserCarResponseFromJson(String str) => AddUserCarResponse.fromJson(json.decode(str));

String addUserCarResponseToJson(AddUserCarResponse data) => json.encode(data.toJson());

class AddUserCarResponse {
    String? userId;
    String? company;
    String? model;
    String? fueltype;
    String? tyretype;
    String? modelYear;
    String? vehicleNumber;
    String? variant;
    String? color;
    String? name;
    String? id;
    DateTime? createdAt;
    DateTime? updatedAt;
    int? v;

    AddUserCarResponse({
        this.userId,
        this.company,
        this.model,
        this.fueltype,
        this.tyretype,
        this.modelYear,
        this.vehicleNumber,
        this.variant,
        this.color,
        this.name,
        this.id,
        this.createdAt,
        this.updatedAt,
        this.v,
    });

    factory AddUserCarResponse.fromJson(Map<String, dynamic> json) => AddUserCarResponse(
        userId: json["userId"],
        company: json["company"],
        model: json["model"],
        fueltype: json["fueltype"],
        tyretype: json["tyretype"],
        modelYear: json["modelYear"],
        vehicleNumber: json["vehicleNumber"],
        variant: json["variant"],
        color: json["color"],
        name: json["name"],
        id: json["_id"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "userId": userId,
        "company": company,
        "model": model,
        "fueltype": fueltype,
        "tyretype": tyretype,
        "modelYear": modelYear,
        "vehicleNumber": vehicleNumber,
        "variant": variant,
        "color": color,
        "name": name,
        "_id": id,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
    };
}
