// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pond.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Pond _$PondFromJson(Map<String, dynamic> json) => Pond(
      id: json['id'] as String,
      name: json['name'] as String,
      address: json['address'] as String,
      city: json['city'] as String,
      seedDate: json['seedDate'] as String,
      seedCount: (json['seedCount'] as num).toInt(),
      imageUrl: json['imageUrl'] as String,
      status: json['status'] as bool,
      isFilled: json['isFilled'] as bool,
      userId: json['userId'] as String?,
      deviceId: json['deviceId'] as String?,
    );

Map<String, dynamic> _$PondToJson(Pond instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'address': instance.address,
      'city': instance.city,
      'seedDate': instance.seedDate,
      'seedCount': instance.seedCount,
      'imageUrl': instance.imageUrl,
      'status': instance.status,
      'isFilled': instance.isFilled,
      'userId': instance.userId,
      'deviceId': instance.deviceId,
    };
