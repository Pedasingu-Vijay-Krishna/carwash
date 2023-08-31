// To parse this JSON data, do
//
//     final subscriptionResponse = subscriptionResponseFromJson(jsonString);

import 'dart:convert';

SubscriptionResponse subscriptionResponseFromJson(String str) => SubscriptionResponse.fromJson(json.decode(str));

String subscriptionResponseToJson(SubscriptionResponse data) => json.encode(data.toJson());

class SubscriptionResponse {
    bool status;
    List<Subscriptionresult> subscriptionresult;

    SubscriptionResponse({
        required this.status,
        required this.subscriptionresult,
    });

    factory SubscriptionResponse.fromJson(Map<String, dynamic> json) => SubscriptionResponse(
        status: json["status"],
        subscriptionresult: List<Subscriptionresult>.from(json["subscriptionresult"].map((x) => Subscriptionresult.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "subscriptionresult": List<dynamic>.from(subscriptionresult.map((x) => x.toJson())),
    };
}

class Subscriptionresult {
    String id;
    String name;
    String descrition;
    int days;
    bool isActive;
    DateTime createdAt;
    DateTime updatedAt;
    int v;
    int? amount;

    Subscriptionresult({
        required this.id,
        required this.name,
        required this.descrition,
        required this.days,
        required this.isActive,
        required this.createdAt,
        required this.updatedAt,
        required this.v,
        this.amount,
    });

    factory Subscriptionresult.fromJson(Map<String, dynamic> json) => Subscriptionresult(
        id: json["_id"],
        name: json["name"],
        descrition: json["descrition"],
        days: json["days"],
        isActive: json["isActive"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        amount: json["amount"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "descrition": descrition,
        "days": days,
        "isActive": isActive,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
        "amount": amount,
    };
}
