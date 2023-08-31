// To parse this JSON data, do
//
//     final userBookingRequest = userBookingRequestFromJson(jsonString);

import 'dart:convert';

UserBookingRequest userBookingRequestFromJson(String str) => UserBookingRequest.fromJson(json.decode(str));

String userBookingRequestToJson(UserBookingRequest data) => json.encode(data.toJson());

class UserBookingRequest {
    String? userId;
    String? carid;
    String? userlocation;
    String? plan;
    DateTime? startDate;
    String? serviceType;
    DateTime? endDate;
    String? paymentId;
    bool? paymentDone;

    UserBookingRequest({
        this.userId,
        this.carid,
        this.userlocation,
        this.plan,
        this.startDate,
        this.serviceType,
        this.endDate,
        this.paymentId,
        this.paymentDone
    });

    factory UserBookingRequest.fromJson(Map<String, dynamic> json) => UserBookingRequest(
        userId: json["userId"],
        carid: json["carid"],
        userlocation: json["userlocation"],
        plan: json["plan"],
        startDate: json["startDate"] == null ? null : DateTime.parse(json["startDate"]),
        serviceType: json["serviceType"],
        endDate: json["endDate"] == null ? null : DateTime.parse(json["endDate"]),
        paymentId: json["paymentId"],
        paymentDone: json["paymentDone"],
    );

    Map<String, dynamic> toJson() => {
        "userId": userId,
        "carid": carid,
        "userlocation": userlocation,
        "plan": plan,
        "paymentDone":paymentDone,
        "startDate": "${startDate!.year.toString().padLeft(4, '0')}-${startDate!.month.toString().padLeft(2, '0')}-${startDate!.day.toString().padLeft(2, '0')}",
        "serviceType": serviceType,
        "endDate": "${endDate!.year.toString().padLeft(4, '0')}-${endDate!.month.toString().padLeft(2, '0')}-${endDate!.day.toString().padLeft(2, '0')}",
        "paymentId": paymentId,
    };
}
