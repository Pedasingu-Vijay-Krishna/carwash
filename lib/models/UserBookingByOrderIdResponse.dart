// To parse this JSON data, do
//
//     final userBookingByOrderIdResponse = userBookingByOrderIdResponseFromJson(jsonString);

import 'dart:convert';

UserBookingByOrderIdResponse userBookingByOrderIdResponseFromJson(String str) => UserBookingByOrderIdResponse.fromJson(json.decode(str));

String userBookingByOrderIdResponseToJson(UserBookingByOrderIdResponse data) => json.encode(data.toJson());

class UserBookingByOrderIdResponse {
    String? id;
    UserId? userId;
    Carid? carid;
    Userlocation? userlocation;
    String? plan;
    DateTime? startDate;
    DateTime? endDate;
    String? serviceType;
    String? paymentId;
    bool? paymentDone;
    String? orderStatus;
    bool? isActive;
    DateTime? createdAt;
    DateTime? updatedAt;
    int? v;

    UserBookingByOrderIdResponse({
        this.id,
        this.userId,
        this.carid,
        this.userlocation,
        this.plan,
        this.startDate,
        this.endDate,
        this.serviceType,
        this.paymentId,
        this.paymentDone,
        this.orderStatus,
        this.isActive,
        this.createdAt,
        this.updatedAt,
        this.v,
    });

    factory UserBookingByOrderIdResponse.fromJson(Map<String, dynamic> json) => UserBookingByOrderIdResponse(
        id: json["_id"],
        userId: json["userId"] == null ? null : UserId.fromJson(json["userId"]),
        carid: json["carid"] == null ? null : Carid.fromJson(json["carid"]),
        userlocation: json["userlocation"] == null ? null : Userlocation.fromJson(json["userlocation"]),
        plan: json["plan"],
        startDate: json["startDate"] == null ? null : DateTime.parse(json["startDate"]),
        endDate: json["endDate"] == null ? null : DateTime.parse(json["endDate"]),
        serviceType: json["serviceType"],
        paymentId: json["paymentId"],
        paymentDone: json["paymentDone"],
        orderStatus: json["OrderStatus"],
        isActive: json["isActive"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "userId": userId?.toJson(),
        "carid": carid?.toJson(),
        "userlocation": userlocation?.toJson(),
        "plan": plan,
        "startDate": startDate?.toIso8601String(),
        "endDate": endDate?.toIso8601String(),
        "serviceType": serviceType,
        "paymentId": paymentId,
        "paymentDone": paymentDone,
        "OrderStatus": orderStatus,
        "isActive": isActive,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
    };
}

class Carid {
    String? id;
    String? userId;
    Company? company;
    Model? model;
    String? fueltype;
    String? tyretype;
    dynamic modelYear;
    String? vehicleNumber;
    String? variant;
    String? color;
    String? name;
    DateTime? createdAt;
    DateTime? updatedAt;
    int? v;

    Carid({
        this.id,
        this.userId,
        this.company,
        this.model,
        this.fueltype,
        this.tyretype,
        this.modelYear,
        this.vehicleNumber,
        this.variant,
        this.color,
        this.name,
        this.createdAt,
        this.updatedAt,
        this.v,
    });

    factory Carid.fromJson(Map<String, dynamic> json) => Carid(
        id: json["_id"],
        userId: json["userId"],
        company: json["company"] == null ? null : Company.fromJson(json["company"]),
        model: json["model"] == null ? null : Model.fromJson(json["model"]),
        fueltype: json["fueltype"],
        tyretype: json["tyretype"],
        modelYear: json["modelYear"],
        vehicleNumber: json["vehicleNumber"],
        variant: json["variant"],
        color: json["color"],
        name: json["name"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "userId": userId,
        "company": company?.toJson(),
        "model": model?.toJson(),
        "fueltype": fueltype,
        "tyretype": tyretype,
        "modelYear": modelYear,
        "vehicleNumber": vehicleNumber,
        "variant": variant,
        "color": color,
        "name": name,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
    };
}

class Company {
    String? id;
    String? company;
    String? picture;
    DateTime? createdAt;
    DateTime? updatedAt;
    int? v;

    Company({
        this.id,
        this.company,
        this.picture,
        this.createdAt,
        this.updatedAt,
        this.v,
    });

    factory Company.fromJson(Map<String, dynamic> json) => Company(
        id: json["_id"],
        company: json["company"],
        picture: json["picture"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "company": company,
        "picture": picture,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
    };
}

class Model {
    String? id;
    String? company;
    String? carModel;
    String? carModelType;
    DateTime? createdAt;
    DateTime? updatedAt;
    int? v;

    Model({
        this.id,
        this.company,
        this.carModel,
        this.carModelType,
        this.createdAt,
        this.updatedAt,
        this.v,
    });

    factory Model.fromJson(Map<String, dynamic> json) => Model(
        id: json["_id"],
        company: json["company"],
        carModel: json["carModel"],
        carModelType: json["carModelType"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "company": company,
        "carModel": carModel,
        "carModelType": carModelType,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
    };
}

class UserId {
    String? id;
    String? name;
    String? gender;
    String? mobilenumber;

    UserId({
        this.id,
        this.name,
        this.gender,
        this.mobilenumber,
    });

    factory UserId.fromJson(Map<String, dynamic> json) => UserId(
        id: json["_id"],
        name: json["name"],
        gender: json["gender"],
        mobilenumber: json["mobilenumber"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "gender": gender,
        "mobilenumber": mobilenumber,
    };
}

class Userlocation {
    Location? location;
    String? id;
    String? userId;
    String? address;
    String? name;
    DateTime? createdAt;
    DateTime? updatedAt;
    int? v;

    Userlocation({
        this.location,
        this.id,
        this.userId,
        this.address,
        this.name,
        this.createdAt,
        this.updatedAt,
        this.v,
    });

    factory Userlocation.fromJson(Map<String, dynamic> json) => Userlocation(
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
