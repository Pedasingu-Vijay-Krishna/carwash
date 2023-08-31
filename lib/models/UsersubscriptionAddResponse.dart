// To parse this JSON data, do
//
//     final usersubscriptionAddResponse = usersubscriptionAddResponseFromJson(jsonString);

import 'dart:convert';

UsersubscriptionAddResponse usersubscriptionAddResponseFromJson(String str) => UsersubscriptionAddResponse.fromJson(json.decode(str));

String usersubscriptionAddResponseToJson(UsersubscriptionAddResponse data) => json.encode(data.toJson());

class UsersubscriptionAddResponse {
    bool? status;
    Result? result;

    UsersubscriptionAddResponse({
        this.status,
        this.result,
    });

    factory UsersubscriptionAddResponse.fromJson(Map<String, dynamic> json) => UsersubscriptionAddResponse(
        status: json["status"],
        result: json["result"] == null ? null : Result.fromJson(json["result"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "result": result?.toJson(),
    };
}

class Result {
    String? userId;
    String? plan;
    DateTime? startDate;
    DateTime? endDate;
    bool? isActive;
    String? id;
    DateTime? createdAt;
    DateTime? updatedAt;
    int? v;

    Result({
        this.userId,
        this.plan,
        this.startDate,
        this.endDate,
        this.isActive,
        this.id,
        this.createdAt,
        this.updatedAt,
        this.v,
    });

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        userId: json["userId"],
        plan: json["plan"],
        startDate: json["startDate"] == null ? null : DateTime.parse(json["startDate"]),
        endDate: json["endDate"] == null ? null : DateTime.parse(json["endDate"]),
        isActive: json["isActive"],
        id: json["_id"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "userId": userId,
        "plan": plan,
        "startDate": startDate?.toIso8601String(),
        "endDate": endDate?.toIso8601String(),
        "isActive": isActive,
        "_id": id,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
    };
}
