// To parse this JSON data, do
//
//     final orderByBetweendatesResponse = orderByBetweendatesResponseFromJson(jsonString);

import 'dart:convert';

OrderByBetweendatesResponse orderByBetweendatesResponseFromJson(String str) => OrderByBetweendatesResponse.fromJson(json.decode(str));

String orderByBetweendatesResponseToJson(OrderByBetweendatesResponse data) => json.encode(data.toJson());

class OrderByBetweendatesResponse {
    List<Patnerresult>? patnerresult;

    OrderByBetweendatesResponse({
        this.patnerresult,
    });

    factory OrderByBetweendatesResponse.fromJson(Map<String, dynamic> json) => OrderByBetweendatesResponse(
        patnerresult: json["patnerresult"] == null ? [] : List<Patnerresult>.from(json["patnerresult"]!.map((x) => Patnerresult.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "patnerresult": patnerresult == null ? [] : List<dynamic>.from(patnerresult!.map((x) => x.toJson())),
    };
}

class Patnerresult {
    String? id;
    String? userId;
    OrderId? orderId;
    Carid? carid;
    Userlocation? userlocation;
    dynamic plan;
    PartnerId? partnerId;
    dynamic startTime;
    dynamic endTime;
    DateTime? serviceDate;
    dynamic serviceDateChange;
    String? serviceDateChangeReason;
    List<dynamic>? beforeImages;
    List<dynamic>? afterImages;
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
        id: json["_id"],
        userId: json["userId"],
        orderId: json["OrderId"] == null ? null : OrderId.fromJson(json["OrderId"]),
        carid: json["carid"] == null ? null : Carid.fromJson(json["carid"]),
        userlocation: json["userlocation"] == null ? null : Userlocation.fromJson(json["userlocation"]),
        plan: json["plan"],
        partnerId: json["partnerId"] == null ? null : PartnerId.fromJson(json["partnerId"]),
        startTime: json["startTime"],
        endTime: json["endTime"],
        serviceDate: json["serviceDate"] == null ? null : DateTime.parse(json["serviceDate"]),
        serviceDateChange: json["ServiceDateChange"],
        serviceDateChangeReason: json["ServiceDateChangeReason"],
        beforeImages: json["BeforeImages"] == null ? [] : List<dynamic>.from(json["BeforeImages"]!.map((x) => x)),
        afterImages: json["AfterImages"] == null ? [] : List<dynamic>.from(json["AfterImages"]!.map((x) => x)),
        remarks: json["remarks"],
        startDate: json["startDate"] == null ? null : DateTime.parse(json["startDate"]),
        endDate: json["endDate"] == null ? null : DateTime.parse(json["endDate"]),
        serviceToday: json["serviceToday"],
        serviceType: json["serviceType"],
        paymentDone: json["paymentDone"],
        orderStatus: json["OrderStatus"],
        isActive: json["isActive"],
        v: json["__v"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "userId": userId,
        "OrderId": orderId?.toJson(),
        "carid": carid?.toJson(),
        "userlocation": userlocation?.toJson(),
        "plan": plan,
        "partnerId": partnerId?.toJson(),
        "startTime": startTime,
        "endTime": endTime,
        "serviceDate": serviceDate?.toIso8601String(),
        "ServiceDateChange": serviceDateChange,
        "ServiceDateChangeReason": serviceDateChangeReason,
        "BeforeImages": beforeImages == null ? [] : List<dynamic>.from(beforeImages!.map((x) => x)),
        "AfterImages": afterImages == null ? [] : List<dynamic>.from(afterImages!.map((x) => x)),
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
    Company? company;
    Company? model;
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
        model: json["model"] == null ? null : Company.fromJson(json["model"]),
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
    String? carModel;
    String? carModelType;

    Company({
        this.id,
        this.company,
        this.picture,
        this.createdAt,
        this.updatedAt,
        this.v,
        this.carModel,
        this.carModelType,
    });

    factory Company.fromJson(Map<String, dynamic> json) => Company(
        id: json["_id"],
        company: json["company"],
        picture: json["picture"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        carModel: json["carModel"],
        carModelType: json["carModelType"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "company": company,
        "picture": picture,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
        "carModel": carModel,
        "carModelType": carModelType,
    };
}

class OrderId {
    String? id;
    String? userId;
    String? carid;
    String? userlocation;
    dynamic plan;
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
    String? partnerId;

    OrderId({
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

    factory OrderId.fromJson(Map<String, dynamic> json) => OrderId(
        id: json["_id"],
        userId: json["userId"],
        carid: json["carid"],
        userlocation: json["userlocation"],
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
        partnerId: json["partnerId"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "userId": userId,
        "carid": carid,
        "userlocation": userlocation,
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
        "partnerId": partnerId,
    };
}

class PartnerId {
    bool? isActive;
    String? id;
    String? name;
    String? lastname;
    String? password;
    String? email;
    String? gender;
    DateTime? dateofbirth;
    String? mobilenumber;
    String? profilepicture;
    DateTime? createdAt;
    DateTime? updatedAt;
    int? v;

    PartnerId({
        this.isActive,
        this.id,
        this.name,
        this.lastname,
        this.password,
        this.email,
        this.gender,
        this.dateofbirth,
        this.mobilenumber,
        this.profilepicture,
        this.createdAt,
        this.updatedAt,
        this.v,
    });

    factory PartnerId.fromJson(Map<String, dynamic> json) => PartnerId(
        isActive: json["isActive"],
        id: json["_id"],
        name: json["name"],
        lastname: json["lastname"],
        password: json["password"],
        email: json["email"],
        gender: json["gender"],
        dateofbirth: json["dateofbirth"] == null ? null : DateTime.parse(json["dateofbirth"]),
        mobilenumber: json["mobilenumber"],
        profilepicture: json["profilepicture"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "isActive": isActive,
        "_id": id,
        "name": name,
        "lastname": lastname,
        "password": password,
        "email": email,
        "gender": gender,
        "dateofbirth": dateofbirth?.toIso8601String(),
        "mobilenumber": mobilenumber,
        "profilepicture": profilepicture,
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
