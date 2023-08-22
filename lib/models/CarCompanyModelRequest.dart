// To parse this JSON data, do
//
//     final carCompanyRequest = carCompanyRequestFromJson(jsonString);

import 'dart:convert';

CarCompanyModelRequest carCompanyRequestFromJson(String str) => CarCompanyModelRequest.fromJson(json.decode(str));

String carCompanyRequestToJson(CarCompanyModelRequest data) => json.encode(data.toJson());

class CarCompanyModelRequest {
    String? company;

    CarCompanyModelRequest({
        this.company,
    });

    factory CarCompanyModelRequest.fromJson(Map<String, dynamic> json) => CarCompanyModelRequest(
        company: json["company"],
    );

    Map<String, dynamic> toJson() => {
        "company": company,
    };
}
