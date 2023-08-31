// To parse this JSON data, do
//
//     final userAddresssResponse = userAddresssResponseFromJson(jsonString);

import 'dart:convert';

UserAddresssResponse userAddresssResponseFromJson(String str) => UserAddresssResponse.fromJson(json.decode(str));

String userAddresssResponseToJson(UserAddresssResponse data) => json.encode(data.toJson());

class UserAddresssResponse {
    bool? status;
    List<Result>? result;

    UserAddresssResponse({
        this.status,
        this.result,
    });

    factory UserAddresssResponse.fromJson(Map<String, dynamic> json) => UserAddresssResponse(
        status: json["status"],
        result: json["result"] == null ? [] : List<Result>.from(json["result"]!.map((x) => Result.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "result": result == null ? [] : List<dynamic>.from(result!.map((x) => x.toJson())),
    };
}

class Result {
    Location? location;
    String? id;
    String? userId;
    String? address;
    String? name;
    DateTime? createdAt;
    DateTime? updatedAt;
    int? v;

    Result({
        this.location,
        this.id,
        this.userId,
        this.address,
        this.name,
        this.createdAt,
        this.updatedAt,
        this.v,
    });

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        location: json["location"] == null ? null : Location.fromJson(json["location"]),
        id: json["_id"],
        userId: json["userId"],
        address: json["address"],
        name: json["name"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "location": location?.toJson(),
        "_id": id,
        "userId": userId,
        "address": address,
        "name": name,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
    };
}

class Location {
    String? type;
    List<double>? coordinates;

    Location({
        this.type,
        this.coordinates,
    });

    factory Location.fromJson(Map<String, dynamic> json) => Location(
        type: json["type"],
        coordinates: json["coordinates"] == null ? [] : List<double>.from(json["coordinates"]!.map((x) => x?.toDouble())),
    );

    Map<String, dynamic> toJson() => {
        "type": type,
        "coordinates": coordinates == null ? [] : List<dynamic>.from(coordinates!.map((x) => x)),
    };
}
