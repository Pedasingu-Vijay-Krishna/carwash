// To parse this JSON data, do
//
//     final addUserCarRequest = addUserCarRequestFromJson(jsonString);

import 'dart:convert';

AddUserCarRequest addUserCarRequestFromJson(String str) => AddUserCarRequest.fromJson(json.decode(str));

String addUserCarRequestToJson(AddUserCarRequest data) => json.encode(data.toJson());

class AddUserCarRequest {
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

    AddUserCarRequest({
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
    });

    factory AddUserCarRequest.fromJson(Map<String, dynamic> json) => AddUserCarRequest(
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
    };
}
