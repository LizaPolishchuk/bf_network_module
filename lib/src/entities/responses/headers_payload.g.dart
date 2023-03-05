// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'headers_payload.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HeadersPayload _$HeadersPayloadFromJson(Map<String, dynamic> json) =>
    HeadersPayload(
      json['sub'] as String,
      json['type'] as String,
      json['user_uuid'] as String,
      json['expire'] as String,
      json['iat'] as String,
    );

Map<String, dynamic> _$HeadersPayloadToJson(HeadersPayload instance) =>
    <String, dynamic>{
      'sub': instance.sub,
      'type': instance.type,
      'user_uuid': instance.userUuid,
      'expire': instance.expire,
      'iat': instance.iat,
    };
