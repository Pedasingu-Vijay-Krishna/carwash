// To parse this JSON data, do
//
//     final userBookingByUserIdResponse = userBookingByUserIdResponseFromJson(jsonString);

import 'dart:convert';

UserBookingByUserIdResponse userBookingByUserIdResponseFromJson(String str) =>
    UserBookingByUserIdResponse.fromJson(json.decode(str));

String userBookingByUserIdResponseToJson(UserBookingByUserIdResponse data) =>
    json.encode(data.toJson());

class UserBookingByUserIdResponse {
  List<Bookigresult>? bookigresults;

  UserBookingByUserIdResponse({
    this.bookigresults,
  });

  factory UserBookingByUserIdResponse.fromJson(Map<String, dynamic> json) =>
      UserBookingByUserIdResponse(
        bookigresults: json["bookigresults"] == null
            ? []
            : List<Bookigresult>.from(
                json["bookigresults"]!.map((x) => Bookigresult.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "bookigresults": bookigresults == null
            ? []
            : List<dynamic>.from(bookigresults!.map((x) => x.toJson())),
      };
}

class Bookigresult {
  String? bookigresultOrderStatus;
  String? id;
  UserId? userId;
  Carid? carid;
  Userlocation? userlocation;
  Plan? plan;
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
  PartnerId? partnerId;

  Bookigresult({
    this.bookigresultOrderStatus,
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
    this.partnerId,
  });

  factory Bookigresult.fromJson(Map<String, dynamic> json) => Bookigresult(
        bookigresultOrderStatus: json["orderStatus"],
        id: json["_id"],
        userId: json["userId"] == null ? null : UserId.fromJson(json["userId"]),
        carid: json["carid"] == null ? null : Carid.fromJson(json["carid"]),
        userlocation: json["userlocation"] == null
            ? null
            : Userlocation.fromJson(json["userlocation"]),
        plan: json["plan"] == null ? null : Plan.fromJson(json["plan"]),
        startDate: json["startDate"] == null
            ? null
            : DateTime.parse(json["startDate"]),
        endDate:
            json["endDate"] == null ? null : DateTime.parse(json["endDate"]),
        serviceType: json["serviceType"],
        paymentId: json["paymentId"],
        paymentDone: json["paymentDone"],
        orderStatus: json["OrderStatus"],
        isActive: json["isActive"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        partnerId: json["partnerId"] == null
            ? null
            : PartnerId.fromJson(json["partnerId"]),
      );

  Map<String, dynamic> toJson() => {
        "orderStatus": bookigresultOrderStatus,
        "_id": id,
        "userId": userId?.toJson(),
        "carid": carid?.toJson(),
        "userlocation": userlocation?.toJson(),
        "plan": plan?.toJson(),
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
        "partnerId": partnerId?.toJson(),
      };
}

class Carid {
  String? id;
  String? userId;
  String? company;
  String? model;
  String? fueltype;
  String? tyretype;
  String? modelYear;
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
        company: json["company"],
        model: json["model"],
        fueltype: json["fueltype"],
        tyretype: json["tyretype"],
        modelYear: json["modelYear"],
        vehicleNumber: json["vehicleNumber"],
        variant: json["variant"],
        color: json["color"],
        name: json["name"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "userId": userId,
        "company": company,
        "model": model,
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

class PartnerId {
  String? id;
  String? name;
  String? lastname;
  String? password;
  String? email;
  String? gender;
  DateTime? dateofbirth;
  String? mobilenumber;
  String? profilepicture;
  bool? isActive;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  PartnerId({
    this.id,
    this.name,
    this.lastname,
    this.password,
    this.email,
    this.gender,
    this.dateofbirth,
    this.mobilenumber,
    this.profilepicture,
    this.isActive,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory PartnerId.fromJson(Map<String, dynamic> json) => PartnerId(
        id: json["_id"],
        name: json["name"],
        lastname: json["lastname"],
        password: json["password"],
        email: json["email"],
        gender: json["gender"],
        dateofbirth: json["dateofbirth"] == null
            ? null
            : DateTime.parse(json["dateofbirth"]),
        mobilenumber: json["mobilenumber"],
        profilepicture: json["profilepicture"],
        isActive: json["isActive"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "lastname": lastname,
        "password": password,
        "email": email,
        "gender": gender,
        "dateofbirth": dateofbirth?.toIso8601String(),
        "mobilenumber": mobilenumber,
        "profilepicture": profilepicture,
        "isActive": isActive,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
      };
}

class Plan {
  String? id;
  String? name;
  String? descrition;
  bool? isActive;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  int? amount;
  int? days;

  Plan({
    this.id,
    this.name,
    this.descrition,
    this.isActive,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.amount,
    this.days,
  });

  factory Plan.fromJson(Map<String, dynamic> json) => Plan(
        id: json["_id"],
        name: json["name"],
        descrition: json["descrition"],
        isActive: json["isActive"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        amount: json["amount"],
        days: json["days"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "descrition": descrition,
        "isActive": isActive,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
        "amount": amount,
        "days": days,
      };
}

class UserId {
  String? id;
  String? name;
  String? lastname;
  String? password;
  String? email;
  DateTime? dateofbirth;
  String? mobilenumber;
  String? profilepicture;
  bool? isActive;
  bool? isVerified;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  UserId({
    this.id,
    this.name,
    this.lastname,
    this.password,
    this.email,
    this.dateofbirth,
    this.mobilenumber,
    this.profilepicture,
    this.isActive,
    this.isVerified,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory UserId.fromJson(Map<String, dynamic> json) => UserId(
        id: json["_id"],
        name: json["name"],
        lastname: json["lastname"],
        password: json["password"],
        email: json["email"],
        dateofbirth: json["dateofbirth"] == null
            ? null
            : DateTime.parse(json["dateofbirth"]),
        mobilenumber: json["mobilenumber"],
        profilepicture: json["profilepicture"],
        isActive: json["isActive"],
        isVerified: json["isVerified"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "lastname": lastname,
        "password": password,
        "email": email,
        "dateofbirth": dateofbirth?.toIso8601String(),
        "mobilenumber": mobilenumber,
        "profilepicture": profilepicture,
        "isActive": isActive,
        "isVerified": isVerified,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
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
        location: json["location"] == null
            ? null
            : Location.fromJson(json["location"]),
        id: json["_id"],
        userId: json["userId"],
        address: json["address"],
        name: json["name"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
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
        coordinates: json["coordinates"] == null
            ? []
            : List<double>.from(json["coordinates"]!.map((x) => x?.toDouble())),
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "coordinates": coordinates == null
            ? []
            : List<dynamic>.from(coordinates!.map((x) => x)),
      };
}
