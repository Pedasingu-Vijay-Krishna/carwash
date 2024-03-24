// To parse this JSON data, do
//
//     final orderByBetweendatesResponse = orderByBetweendatesResponseFromJson(jsonString);

import 'dart:convert';

OrderByBetweendatesResponse orderByBetweendatesResponseFromJson(String str) =>
    OrderByBetweendatesResponse.fromJson(json.decode(str));

String orderByBetweendatesResponseToJson(OrderByBetweendatesResponse data) =>
    json.encode(data.toJson());

class OrderByBetweendatesResponse {
  List<Patnerresult>? patnerresult;

  OrderByBetweendatesResponse({
    this.patnerresult,
  });

  factory OrderByBetweendatesResponse.fromJson(Map<String, dynamic> json) =>
      OrderByBetweendatesResponse(
        patnerresult: json["patnerresult"] == null
            ? []
            : List<Patnerresult>.from(
                json["patnerresult"]!.map((x) => Patnerresult.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "patnerresult": patnerresult == null
            ? []
            : List<dynamic>.from(patnerresult!.map((x) => x.toJson())),
      };
}

class Patnerresult {
  List<String>? patnerresultBeforeImages;
  List<String>? patnerresultAfterImages;
  String? patnerresultOrderStatus;
  String? id;
  UserId? userId;
  String? orderId;
  Carid? carid;
  Userlocation? userlocation;
  Plan? plan;
  PartnerId? partnerId;
  dynamic startTime;
  dynamic endTime;
  DateTime? serviceDate;
  dynamic serviceDateChange;
  String? serviceDateChangeReason;
  List<String>? beforeImages;
  List<String>? afterImages;
  String? remarks;
  DateTime? startDate;
  DateTime? endDate;
  String? serviceToday;
  String? serviceType;
  bool? paymentDone;
  String? orderStatus;
  bool? isActive;
  int? v;
  DateTime? createdAt;
  DateTime? updatedAt;

  Patnerresult({
    this.patnerresultBeforeImages,
    this.patnerresultAfterImages,
    this.patnerresultOrderStatus,
    this.id,
    this.userId,
    this.orderId,
    this.carid,
    this.userlocation,
    this.plan,
    this.partnerId,
    this.startTime,
    this.endTime,
    this.serviceDate,
    this.serviceDateChange,
    this.serviceDateChangeReason,
    this.beforeImages,
    this.afterImages,
    this.remarks,
    this.startDate,
    this.endDate,
    this.serviceToday,
    this.serviceType,
    this.paymentDone,
    this.orderStatus,
    this.isActive,
    this.v,
    this.createdAt,
    this.updatedAt,
  });

  factory Patnerresult.fromJson(Map<String, dynamic> json) => Patnerresult(
        patnerresultBeforeImages: json["beforeImages"] == null
            ? []
            : List<String>.from(json["beforeImages"]!.map((x) => x)),
        patnerresultAfterImages: json["afterImages"] == null
            ? []
            : List<String>.from(json["afterImages"]!.map((x) => x)),
        patnerresultOrderStatus: json["orderStatus"],
        id: json["_id"],
        userId: json["userId"] == null ? null : UserId.fromJson(json["userId"]),
        orderId: json["OrderId"],
        carid: json["carid"] == null ? null : Carid.fromJson(json["carid"]),
        userlocation: json["userlocation"] == null
            ? null
            : Userlocation.fromJson(json["userlocation"]),
        plan: json["plan"] == null ? null : Plan.fromJson(json["plan"]),
        partnerId: json["partnerId"] == null
            ? null
            : PartnerId.fromJson(json["partnerId"]),
        startTime: json["startTime"],
        endTime: json["endTime"],
        serviceDate: json["serviceDate"] == null
            ? null
            : DateTime.parse(json["serviceDate"]),
        serviceDateChange: json["ServiceDateChange"],
        serviceDateChangeReason: json["ServiceDateChangeReason"],
        beforeImages: json["BeforeImages"] == null
            ? []
            : List<String>.from(json["BeforeImages"]!.map((x) => x)),
        afterImages: json["AfterImages"] == null
            ? []
            : List<String>.from(json["AfterImages"]!.map((x) => x)),
        remarks: json["remarks"],
        startDate: json["startDate"] == null
            ? null
            : DateTime.parse(json["startDate"]),
        endDate:
            json["endDate"] == null ? null : DateTime.parse(json["endDate"]),
        serviceToday: json["serviceToday"],
        serviceType: json["serviceType"],
        paymentDone: json["paymentDone"],
        orderStatus: json["OrderStatus"],
        isActive: json["isActive"],
        v: json["__v"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "beforeImages": patnerresultBeforeImages == null
            ? []
            : List<dynamic>.from(patnerresultBeforeImages!.map((x) => x)),
        "afterImages": patnerresultAfterImages == null
            ? []
            : List<dynamic>.from(patnerresultAfterImages!.map((x) => x)),
        "orderStatus": patnerresultOrderStatus,
        "_id": id,
        "userId": userId?.toJson(),
        "OrderId": orderId,
        "carid": carid?.toJson(),
        "userlocation": userlocation?.toJson(),
        "plan": plan?.toJson(),
        "partnerId": partnerId?.toJson(),
        "startTime": startTime,
        "endTime": endTime,
        "serviceDate": serviceDate?.toIso8601String(),
        "ServiceDateChange": serviceDateChange,
        "ServiceDateChangeReason": serviceDateChangeReason,
        "BeforeImages": beforeImages == null
            ? []
            : List<dynamic>.from(beforeImages!.map((x) => x)),
        "AfterImages": afterImages == null
            ? []
            : List<dynamic>.from(afterImages!.map((x) => x)),
        "remarks": remarks,
        "startDate": startDate?.toIso8601String(),
        "endDate": endDate?.toIso8601String(),
        "serviceToday": serviceToday,
        "serviceType": serviceType,
        "paymentDone": paymentDone,
        "OrderStatus": orderStatus,
        "isActive": isActive,
        "__v": v,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
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
