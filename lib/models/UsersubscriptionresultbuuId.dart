// To parse this JSON data, do
//
//     final usersubscriptionresultbuuId = usersubscriptionresultbuuIdFromJson(jsonString);

import 'dart:convert';

UsersubscriptionresultbuuId usersubscriptionresultbuuIdFromJson(String str) => UsersubscriptionresultbuuId.fromJson(json.decode(str));

String usersubscriptionresultbuuIdToJson(UsersubscriptionresultbuuId data) => json.encode(data.toJson());

class UsersubscriptionresultbuuId {
    bool? status;
    List<Usersubscriptionresult>? usersubscriptionresult;

    UsersubscriptionresultbuuId({
        this.status,
        this.usersubscriptionresult,
    });

    factory UsersubscriptionresultbuuId.fromJson(Map<String, dynamic> json) => UsersubscriptionresultbuuId(
        status: json["status"],
        usersubscriptionresult: json["usersubscriptionresult"] == null ? [] : List<Usersubscriptionresult>.from(json["usersubscriptionresult"]!.map((x) => Usersubscriptionresult.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "usersubscriptionresult": usersubscriptionresult == null ? [] : List<dynamic>.from(usersubscriptionresult!.map((x) => x.toJson())),
    };
}

class Usersubscriptionresult {
    String? id;
    UserId? userId;
    Plan? plan;
    DateTime? startDate;
    DateTime? endDate;
    bool? isActive;
    DateTime? createdAt;
    DateTime? updatedAt;
    int? v;

    Usersubscriptionresult({
        this.id,
        this.userId,
        this.plan,
        this.startDate,
        this.endDate,
        this.isActive,
        this.createdAt,
        this.updatedAt,
        this.v,
    });

    factory Usersubscriptionresult.fromJson(Map<String, dynamic> json) => Usersubscriptionresult(
        id: json["_id"],
        userId: json["userId"] == null ? null : UserId.fromJson(json["userId"]),
        plan: json["plan"] == null ? null : Plan.fromJson(json["plan"]),
        startDate: json["startDate"] == null ? null : DateTime.parse(json["startDate"]),
        endDate: json["endDate"] == null ? null : DateTime.parse(json["endDate"]),
        isActive: json["isActive"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "userId": userId?.toJson(),
        "plan": plan?.toJson(),
        "startDate": startDate?.toIso8601String(),
        "endDate": endDate?.toIso8601String(),
        "isActive": isActive,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
    };
}

class Plan {
    String? id;
    String? name;
    String? descrition;
    int? days;
    bool? isActive;
    DateTime? createdAt;
    DateTime? updatedAt;
    int? v;

    Plan({
        this.id,
        this.name,
        this.descrition,
        this.days,
        this.isActive,
        this.createdAt,
        this.updatedAt,
        this.v,
    });

    factory Plan.fromJson(Map<String, dynamic> json) => Plan(
        id: json["_id"],
        name: json["name"],
        descrition: json["descrition"],
        days: json["days"],
        isActive: json["isActive"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "descrition": descrition,
        "days": days,
        "isActive": isActive,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
    };
}

class UserId {
    String? id;
    String? name;
    String? lastname;
    String? email;
    String? mobilenumber;

    UserId({
        this.id,
        this.name,
        this.lastname,
        this.email,
        this.mobilenumber,
    });

    factory UserId.fromJson(Map<String, dynamic> json) => UserId(
        id: json["_id"],
        name: json["name"],
        lastname: json["lastname"],
        email: json["email"],
        mobilenumber: json["mobilenumber"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "lastname": lastname,
        "email": email,
        "mobilenumber": mobilenumber,
    };
}
