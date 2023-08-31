// To parse this JSON data, do
//
//     final addAddresssResponse = addAddresssResponseFromJson(jsonString);

import 'dart:convert';

AddAddresssResponse addAddresssResponseFromJson(String str) => AddAddresssResponse.fromJson(json.decode(str));

String addAddresssResponseToJson(AddAddresssResponse data) => json.encode(data.toJson());

class AddAddresssResponse {
    bool? status;
    Result? result;

    AddAddresssResponse({
        this.status,
        this.result,
    });

    factory AddAddresssResponse.fromJson(Map<String, dynamic> json) => AddAddresssResponse(
        status: json["status"],
        result: json["result"] == null ? null : Result.fromJson(json["result"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "result": result?.toJson(),
    };
}

class Result {
    String? userId;
    Location? location;
    String? address;
    String? name;
    String? id;
    DateTime? createdAt;
    DateTime? updatedAt;
    int? v;

    Result({
        this.userId,
        this.location,
        this.address,
        this.name,
        this.id,
        this.createdAt,
        this.updatedAt,
        this.v,
    });

    factory Result.fromJson(Map<String, dynamic> json) => Result(
        userId: json["userId"],
        location: json["location"] == null ? null : Location.fromJson(json["location"]),
        address: json["address"],
        name: json["name"],
        id: json["_id"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "userId": userId,
        "location": location?.toJson(),
        "address": address,
        "name": name,
        "_id": id,
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
