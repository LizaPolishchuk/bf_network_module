// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signed_url_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignedUrlResponse _$SignedUrlResponseFromJson(Map<String, dynamic> json) =>
    SignedUrlResponse(
      json['uuid'] as String?,
      json['detail'] as String?,
      json['path'] as String,
    );

Map<String, dynamic> _$SignedUrlResponseToJson(SignedUrlResponse instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'detail': instance.detail,
      'path': instance.path,
    };
