// To parse this JSON data, do
//
//     final addAddresss = addAddresssFromJson(jsonString);

import 'dart:convert';

AddAddresss addAddresssFromJson(String str) => AddAddresss.fromJson(json.decode(str));

String addAddresssToJson(AddAddresss data) => json.encode(data.toJson());

class AddAddresss {
    String? userId;
    String? latitude;
    String? longitude;
    String? address;
    String? name;

    AddAddresss({
        this.userId,
        this.latitude,
        this.longitude,
        this.address,
        this.name,
    });

    factory AddAddresss.fromJson(Map<String, dynamic> json) => AddAddresss(
        userId: json["userId"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        address: json["address"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "userId": userId,
        "latitude": latitude,
        "longitude": longitude,
        "address": address,
        "name": name,
    };
}
