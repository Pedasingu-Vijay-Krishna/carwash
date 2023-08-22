// To parse this JSON data, do
//
//     final loginResponse = loginResponseFromJson(jsonString);

import 'dart:convert';

LoginResponse loginResponseFromJson(String str) => LoginResponse.fromJson(json.decode(str));

String loginResponseToJson(LoginResponse data) => json.encode(data.toJson());

class LoginResponse {
    bool? status;
    Result? result;
    String? message;

    LoginResponse({
        this.status,
        this.result,
        this.message,
    });

    factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        status: json["status"],
        result: json["result"] == null ? null : Result.fromJson(json["result"]),
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "result": result?.toJson(),
        "message": message,
    };
}

class Result {
    String? id;
    String? mobilenumber;
    String? name;
    String? email;
    bool? isActive;
    bool? isVerified;

    Result({
        this.id,
        this.mobilenumber,
        this.name,
        this.email,
        this.isActive,
        this.isVerified,
    });

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["_id"],
        mobilenumber: json["mobilenumber"],
        name: json["name"],
        email: json["email"],
        isActive: json["isActive"],
        isVerified: json["isVerified"],

    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "mobilenumber": mobilenumber,
        "name": name,
        "email": email,
        "isActive": isActive,
        "isVerified":isVerified,
    };
}
