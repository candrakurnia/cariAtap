// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeModel _$HomeModelFromJson(Map<String, dynamic> json) => HomeModel(
  data: (json['data'] as List<dynamic>?)
      ?.map((e) => Datum.fromJson(e as Map<String, dynamic>))
      .toList(),
  message: json['message'] as String?,
  meta: json['meta'] == null
      ? null
      : Meta.fromJson(json['meta'] as Map<String, dynamic>),
  statusCode: (json['statusCode'] as num?)?.toInt(),
);

Map<String, dynamic> _$HomeModelToJson(HomeModel instance) => <String, dynamic>{
  'data': instance.data,
  'message': instance.message,
  'meta': instance.meta,
  'statusCode': instance.statusCode,
};

Datum _$DatumFromJson(Map<String, dynamic> json) => Datum(
  id: (json['id'] as num?)?.toInt(),
  name: json['name'] as String?,
  address: json['address'] as String?,
  price: (json['price'] as num?)?.toInt(),
  facility: json['facility'],
  type: $enumDecodeNullable(_$TypeEnumMap, json['type']),
  rating: (json['rating'] as num?)?.toDouble(),
  coordinate: json['coordinate'],
  images: (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
);

Map<String, dynamic> _$DatumToJson(Datum instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'address': instance.address,
  'price': instance.price,
  'facility': instance.facility,
  'type': _$TypeEnumMap[instance.type],
  'rating': instance.rating,
  'coordinate': instance.coordinate,
  'images': instance.images,
};

const _$TypeEnumMap = {
  Type.APARTMENT: 'apartment',
  Type.HOUSE: 'house',
  Type.VILLA: 'villa',
};

CoordinateClass _$CoordinateClassFromJson(Map<String, dynamic> json) =>
    CoordinateClass(
      lat: (json['lat'] as num?)?.toDouble(),
      lng: (json['lng'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$CoordinateClassToJson(CoordinateClass instance) =>
    <String, dynamic>{'lat': instance.lat, 'lng': instance.lng};

Meta _$MetaFromJson(Map<String, dynamic> json) => Meta();

Map<String, dynamic> _$MetaToJson(Meta instance) => <String, dynamic>{};
