// To parse this JSON data, do
//
//     final carsByUserId = carsByUserIdFromJson(jsonString);

import 'dart:convert';

CarsByUserId carsByUserIdFromJson(String str) => CarsByUserId.fromJson(json.decode(str));

String carsByUserIdToJson(CarsByUserId data) => json.encode(data.toJson());

class CarsByUserId {
    bool? status;
    List<Result>? result;

    CarsByUserId({
        this.status,
        this.result,
    });

    factory CarsByUserId.fromJson(Map<String, dynamic> json) => CarsByUserId(
        status: json["status"],
        result: json["result"] == null ? [] : List<Result>.from(json["result"]!.map((x) => Result.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "result": result == null ? [] : List<dynamic>.from(result!.map((x) => x.toJson())),
    };
}

class Result {
    String? id;
    String? userId;
    Company? company;
    Model? model;
    String? fueltype;
    String? tyretype;
    dynamic modelYear;
    String? vehicleNumber;
    String? variant;
    String? color;
    String? name;
    DateTime? createdAt;
    DateTime? updatedAt;
    int? v;

    Result({
        this.id,
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
        this.createdAt,
        this.updatedAt,
        this.v,
    });

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["_id"],
        userId: json["userId"],
        company: json["company"] == null ? null : Company.fromJson(json["company"]),
        model: json["model"] == null ? null : Model.fromJson(json["model"]),
        fueltype: json["fueltype"],
        tyretype: json["tyretype"],
        modelYear: json["modelYear"],
        vehicleNumber: json["vehicleNumber"],
        variant: json["variant"],
        color: json["color"],
        name: json["name"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "userId": userId,
        "company": company?.toJson(),
        "model": model?.toJson(),
        "fueltype": fueltype,
        "tyretype": tyretype,
        "modelYear": modelYear,
        "vehicleNumber": vehicleNumber,
        "variant": variant,
        "color": color,
        "name": name,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
    };
}

class Company {
    String? id;
    String? company;
    String? picture;
    DateTime? createdAt;
    DateTime? updatedAt;
    int? v;

    Company({
        this.id,
        this.company,
        this.picture,
        this.createdAt,
        this.updatedAt,
        this.v,
    });

    factory Company.fromJson(Map<String, dynamic> json) => Company(
        id: json["_id"],
        company: json["company"],
        picture: json["picture"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "company": company,
        "picture": picture,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
    };
}

class Model {
    String? id;
    String? company;
    String? carModel;
    String? carModelType;
    DateTime? createdAt;
    DateTime? updatedAt;
    int? v;

    Model({
        this.id,
        this.company,
        this.carModel,
        this.carModelType,
        this.createdAt,
        this.updatedAt,
        this.v,
    });

    factory Model.fromJson(Map<String, dynamic> json) => Model(
        id: json["_id"],
        company: json["company"],
        carModel: json["carModel"],
        carModelType: json["carModelType"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "company": company,
        "carModel": carModel,
        "carModelType": carModelType,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
    };
}
