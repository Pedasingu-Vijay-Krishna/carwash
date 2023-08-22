// To parse this JSON data, do
//
//     final userRegisterRequest = userRegisterRequestFromJson(jsonString);

import 'dart:convert';

UserRegisterRequest userRegisterRequestFromJson(String str) => UserRegisterRequest.fromJson(json.decode(str));

String userRegisterRequestToJson(UserRegisterRequest data) => json.encode(data.toJson());

class UserRegisterRequest {
    String? name;
    String? password;
    String? lastname;
    String? email;
    String? mobilenumber;
    String? gender;
    DateTime? dateofbirth;
    String? profilepicture;

    UserRegisterRequest({
        this.name,
        this.password,
        this.lastname,
        this.email,
        this.mobilenumber,
        this.gender,
        this.dateofbirth,
        this.profilepicture,
    });

    factory UserRegisterRequest.fromJson(Map<String, dynamic> json) => UserRegisterRequest(
        name: json["name"],
        password: json["password"],
        lastname: json["lastname"],
        email: json["email"],
        mobilenumber: json["mobilenumber"],
        gender: json["gender"],
        dateofbirth: json["dateofbirth"] == null ? null : DateTime.parse(json["dateofbirth"]),
        profilepicture: json["profilepicture"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "password": password,
        "lastname": lastname,
        "email": email,
        "mobilenumber": mobilenumber,
        "gender": gender,
        "dateofbirth": dateofbirth==null?null:"${dateofbirth!.year.toString().padLeft(4, '0')}-${dateofbirth!.month.toString().padLeft(2, '0')}-${dateofbirth!.day.toString().padLeft(2, '0')}",
        "profilepicture": profilepicture,
    };
}
