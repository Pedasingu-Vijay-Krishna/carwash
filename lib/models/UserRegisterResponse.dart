// To parse this JSON data, do
//
//     final userRegisterResponse = userRegisterResponseFromJson(jsonString);

import 'dart:convert';

UserRegisterResponse userRegisterResponseFromJson(String str) => UserRegisterResponse.fromJson(json.decode(str));

String userRegisterResponseToJson(UserRegisterResponse data) => json.encode(data.toJson());

class UserRegisterResponse {
    String? name;
    String? lastname;
    String? password;
    String? email;
    String? gender;
    DateTime? dateofbirth;
    String? mobilenumber;
    String? profilepicture;
    bool? isActive;
    bool? isVerified;
    String? id;
    DateTime? createdAt;
    DateTime? updatedAt;
    int? v;

    UserRegisterResponse({
        this.name,
        this.lastname,
        this.password,
        this.email,
        this.gender,
        this.dateofbirth,
        this.mobilenumber,
        this.profilepicture,
        this.isActive,
        this.isVerified,
        this.id,
        this.createdAt,
        this.updatedAt,
        this.v,
    });

    factory UserRegisterResponse.fromJson(Map<String, dynamic> json) => UserRegisterResponse(
        name: json["name"],
        lastname: json["lastname"],
        password: json["password"],
        email: json["email"],
        gender: json["gender"],
        dateofbirth: json["dateofbirth"] == null ? null : DateTime.parse(json["dateofbirth"]),
        mobilenumber: json["mobilenumber"],
        profilepicture: json["profilepicture"],
        isActive: json["isActive"],
        isVerified: json["isVerified"],
        id: json["_id"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "lastname": lastname,
        "password": password,
        "email": email,
        "gender": gender,
        "dateofbirth": dateofbirth?.toIso8601String(),
        "mobilenumber": mobilenumber,
        "profilepicture": profilepicture,
        "isActive": isActive,
        "isVerified":isVerified,
        "_id": id,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
    };
}
