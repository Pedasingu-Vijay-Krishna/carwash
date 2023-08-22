// To parse this JSON data, do
//
//     final carCompanyModelResponse = carCompanyModelResponseFromJson(jsonString);

import 'dart:convert';

CarCompanyModelResponse carCompanyModelResponseFromJson(String str) => CarCompanyModelResponse.fromJson(json.decode(str));

String carCompanyModelResponseToJson(CarCompanyModelResponse data) => json.encode(data.toJson());

class CarCompanyModelResponse {
    List<Result>? result;

    CarCompanyModelResponse({
        this.result,
    });

    factory CarCompanyModelResponse.fromJson(Map<String, dynamic> json) => CarCompanyModelResponse(
        result: json["result"] == null ? [] : List<Result>.from(json["result"]!.map((x) => Result.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "result": result == null ? [] : List<dynamic>.from(result!.map((x) => x.toJson())),
    };
}

class Result {
    String? id;
    Company? company;
    String? carModel;
    String? carModelType;
    DateTime? createdAt;
    DateTime? updatedAt;
    int? v;

    Result({
        this.id,
        this.company,
        this.carModel,
        this.carModelType,
        this.createdAt,
        this.updatedAt,
        this.v,
    });

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["_id"],
        company: json["company"] == null ? null : Company.fromJson(json["company"]),
        carModel: json["carModel"],
        carModelType: json["carModelType"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "company": company?.toJson(),
        "carModel": carModel,
        "carModelType": carModelType,
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
