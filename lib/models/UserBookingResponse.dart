// To parse this JSON data, do
//
//     final userBookingResponse = userBookingResponseFromJson(jsonString);

import 'dart:convert';

UserBookingResponse userBookingResponseFromJson(String str) => UserBookingResponse.fromJson(json.decode(str));

String userBookingResponseToJson(UserBookingResponse data) => json.encode(data.toJson());

class UserBookingResponse {
    String? userId;
    String? carid;
    String? userlocation;
    String? plan;
    DateTime? startDate;
    DateTime? endDate;
    String? serviceType;
    String? paymentId;
    bool? paymentDone;
    String? orderStatus;
    bool? isActive;
    String? id;
    DateTime? createdAt;
    DateTime? updatedAt;
    int? v;

    UserBookingResponse({
        this.userId,
        this.carid,
        this.userlocation,
        this.plan,
        this.startDate,
        this.endDate,
        this.serviceType,
        this.paymentId,
        this.paymentDone,
        this.orderStatus,
        this.isActive,
        this.id,
        this.createdAt,
        this.updatedAt,
        this.v,
    });

    factory UserBookingResponse.fromJson(Map<String, dynamic> json) => UserBookingResponse(
        userId: json["userId"],
        carid: json["carid"],
        userlocation: json["userlocation"],
        plan: json["plan"],
        startDate: json["startDate"] == null ? null : DateTime.parse(json["startDate"]),
        endDate: json["endDate"] == null ? null : DateTime.parse(json["endDate"]),
        serviceType: json["serviceType"],
        paymentId: json["paymentId"],
        paymentDone: json["paymentDone"],
        orderStatus: json["OrderStatus"],
        isActive: json["isActive"],
        id: json["_id"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "userId": userId,
        "carid": carid,
        "userlocation": userlocation,
        "plan": plan,
        "startDate": startDate?.toIso8601String(),
        "endDate": endDate?.toIso8601String(),
        "serviceType": serviceType,
        "paymentId": paymentId,
        "paymentDone": paymentDone,
        "OrderStatus": orderStatus,
        "isActive": isActive,
        "_id": id,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
    };
}
