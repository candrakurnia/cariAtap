// To parse this JSON data, do
//
//     final homeModel = homeModelFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'home_model.g.dart';

HomeModel homeModelFromJson(String str) => HomeModel.fromJson(json.decode(str));

String homeModelToJson(HomeModel data) => json.encode(data.toJson());

@JsonSerializable()
class HomeModel {
    @JsonKey(name: "data")
    List<Datum>? data;
    @JsonKey(name: "message")
    String? message;
    @JsonKey(name: "meta")
    Meta? meta;
    @JsonKey(name: "statusCode")
    int? statusCode;

    HomeModel({
        this.data,
        this.message,
        this.meta,
        this.statusCode,
    });

    factory HomeModel.fromJson(Map<String, dynamic> json) => _$HomeModelFromJson(json);

    Map<String, dynamic> toJson() => _$HomeModelToJson(this);
}

@JsonSerializable()
class Datum {
    @JsonKey(name: "id")
    int? id;
    @JsonKey(name: "name")
    String? name;
    @JsonKey(name: "address")
    String? address;
    @JsonKey(name: "price")
    int? price;
    @JsonKey(name: "facility")
    dynamic facility;
    @JsonKey(name: "type")
    Type? type;
    @JsonKey(name: "rating")
    double? rating;
    @JsonKey(name: "coordinate")
    dynamic coordinate;
    @JsonKey(name: "images")
    List<String>? images;

    Datum({
        this.id,
        this.name,
        this.address,
        this.price,
        this.facility,
        this.type,
        this.rating,
        this.coordinate,
        this.images,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => _$DatumFromJson(json);

    Map<String, dynamic> toJson() => _$DatumToJson(this);
}

@JsonSerializable()
class CoordinateClass {
    @JsonKey(name: "lat")
    double? lat;
    @JsonKey(name: "lng")
    double? lng;

    CoordinateClass({
        this.lat,
        this.lng,
    });

    factory CoordinateClass.fromJson(Map<String, dynamic> json) => _$CoordinateClassFromJson(json);

    Map<String, dynamic> toJson() => _$CoordinateClassToJson(this);
}

enum Type {
    @JsonValue("apartment")
    APARTMENT,
    @JsonValue("house")
    HOUSE,
    @JsonValue("villa")
    VILLA
}

final typeValues = EnumValues({
    "apartment": Type.APARTMENT,
    "house": Type.HOUSE,
    "villa": Type.VILLA
});

@JsonSerializable()
class Meta {
    Meta();

    factory Meta.fromJson(Map<String, dynamic> json) => _$MetaFromJson(json);

    Map<String, dynamic> toJson() => _$MetaToJson(this);
}

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
            reverseMap = map.map((k, v) => MapEntry(v, k));
            return reverseMap;
    }
}
