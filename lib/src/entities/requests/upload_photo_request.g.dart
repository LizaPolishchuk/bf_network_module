// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upload_photo_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UploadPhotoRequest _$UploadPhotoRequestFromJson(Map<String, dynamic> json) =>
    UploadPhotoRequest(
      json['url'] as String,
      json['photo_type'] as String,
    );

Map<String, dynamic> _$UploadPhotoRequestToJson(UploadPhotoRequest instance) =>
    <String, dynamic>{
      'url': instance.url,
      'photo_type': instance.photoType,
    };
