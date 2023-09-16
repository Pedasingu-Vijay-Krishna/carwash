// To parse this JSON data, do
//
//     final orderByBetweendatesResquest = orderByBetweendatesResquestFromJson(jsonString);

import 'dart:convert';

OrderByBetweendatesResquest orderByBetweendatesResquestFromJson(String str) => OrderByBetweendatesResquest.fromJson(json.decode(str));

String orderByBetweendatesResquestToJson(OrderByBetweendatesResquest data) => json.encode(data.toJson());

class OrderByBetweendatesResquest {
    String? userId;
    DateTime? date;
    DateTime? endDate;

    OrderByBetweendatesResquest({
        this.userId,
        this.date,
        this.endDate,
    });

    factory OrderByBetweendatesResquest.fromJson(Map<String, dynamic> json) => OrderByBetweendatesResquest(
        userId: json["userId"],
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        endDate: json["endDate"] == null ? null : DateTime.parse(json["endDate"]),
    );

    Map<String, dynamic> toJson() => {
        "userId": userId,
        "date": "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
        "endDate": "${endDate!.year.toString().padLeft(4, '0')}-${endDate!.month.toString().padLeft(2, '0')}-${endDate!.day.toString().padLeft(2, '0')}",
    };
}
