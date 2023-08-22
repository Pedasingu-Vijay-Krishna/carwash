// To parse this JSON data, do
//
//     final carCompanyResponse = carCompanyResponseFromJson(jsonString);

import 'dart:convert';

CarCompanyResponse carCompanyResponseFromJson(String str) => CarCompanyResponse.fromJson(json.decode(str));

String carCompanyResponseToJson(CarCompanyResponse data) => json.encode(data.toJson());

class CarCompanyResponse {
    bool? status;
    List<Result>? result;

    CarCompanyResponse({
        this.status,
        this.result,
    });

    factory CarCompanyResponse.fromJson(Map<String, dynamic> json) => CarCompanyResponse(
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
    String? company;
    String? picture;
    DateTime? createdAt;
    DateTime? updatedAt;
    int? v;

    Result({
        this.id,
        this.company,
        this.picture,
        this.createdAt,
        this.updatedAt,
        this.v,
    });

    factory Result.fromJson(Map<String, dynamic> json) => Result(
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
