// To parse this JSON data, do
//
//     final baseModel = baseModelFromJson(jsonString);

import 'dart:convert';

BaseModel baseModelFromJson(String str) => BaseModel.fromJson(json.decode(str));

String baseModelToJson(BaseModel data) => json.encode(data.toJson());

class BaseModel {
    Data? data;
    String? message;
    Meta? meta;
    int? statusCode;

    BaseModel({
        this.data,
        this.message,
        this.meta,
        this.statusCode,
    });

    factory BaseModel.fromJson(Map<String, dynamic> json) => BaseModel(
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
        message: json["message"],
        meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
        statusCode: json["statusCode"],
    );

    Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
        "message": message,
        "meta": meta?.toJson(),
        "statusCode": statusCode,
    };
}

class Data {
    User? user;

    Data({
        this.user,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        user: json["user"] == null ? null : User.fromJson(json["user"]),
    );

    Map<String, dynamic> toJson() => {
        "user": user?.toJson(),
    };
}

class User {
    int? id;
    String? name;
    String? email;
    String? role;
    String? confirmationId;
    dynamic dateConfirmed;
    DateTime? updatedAt;
    DateTime? createdAt;

    User({
        this.id,
        this.name,
        this.email,
        this.role,
        this.confirmationId,
        this.dateConfirmed,
        this.updatedAt,
        this.createdAt,
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        role: json["role"],
        confirmationId: json["confirmationId"],
        dateConfirmed: json["dateConfirmed"],
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "role": role,
        "confirmationId": confirmationId,
        "dateConfirmed": dateConfirmed,
        "updatedAt": updatedAt?.toIso8601String(),
        "createdAt": createdAt?.toIso8601String(),
    };
}

class Meta {
    Meta();

    factory Meta.fromJson(Map<String, dynamic> json) => Meta(
    );

    Map<String, dynamic> toJson() => {
    };
}
