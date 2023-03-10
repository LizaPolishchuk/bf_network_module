// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'like_salon_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LikeSalonRequest _$LikeSalonRequestFromJson(Map<String, dynamic> json) =>
    LikeSalonRequest(
      json['user_uuid'] as String,
      json['salon_uuid'] as String,
      json['sign'] as int,
    );

Map<String, dynamic> _$LikeSalonRequestToJson(LikeSalonRequest instance) =>
    <String, dynamic>{
      'user_uuid': instance.userId,
      'salon_uuid': instance.salonId,
      'sign': instance.sign,
    };
