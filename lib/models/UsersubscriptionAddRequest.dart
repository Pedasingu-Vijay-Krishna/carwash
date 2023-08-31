// To parse this JSON data, do
//
//     final usersubscriptionAddRequest = usersubscriptionAddRequestFromJson(jsonString);

import 'dart:convert';

UsersubscriptionAddRequest usersubscriptionAddRequestFromJson(String str) => UsersubscriptionAddRequest.fromJson(json.decode(str));

String usersubscriptionAddRequestToJson(UsersubscriptionAddRequest data) => json.encode(data.toJson());

class UsersubscriptionAddRequest {
    String? userId;
    String? plan;
    DateTime? startDate;
    DateTime? endDate;

    UsersubscriptionAddRequest({
        this.userId,
        this.plan,
        this.startDate,
        this.endDate,
    });

    factory UsersubscriptionAddRequest.fromJson(Map<String, dynamic> json) => UsersubscriptionAddRequest(
        userId: json["userId"],
        plan: json["plan"],
        startDate: json["startDate"] == null ? null : DateTime.parse(json["startDate"]),
        endDate: json["endDate"] == null ? null : DateTime.parse(json["endDate"]),
    );

    Map<String, dynamic> toJson() => {
        "userId": userId,
        "plan": plan,
        "startDate": "${startDate!.year.toString().padLeft(4, '0')}-${startDate!.month.toString().padLeft(2, '0')}-${startDate!.day.toString().padLeft(2, '0')}",
        "endDate": "${endDate!.year.toString().padLeft(4, '0')}-${endDate!.month.toString().padLeft(2, '0')}-${endDate!.day.toString().padLeft(2, '0')}",
    };
}
