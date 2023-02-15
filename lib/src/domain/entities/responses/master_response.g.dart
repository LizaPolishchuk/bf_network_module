// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'master_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MasterResponse _$MasterResponseFromJson(Map<String, dynamic> json) =>
    MasterResponse(
      json['master'] == null
          ? null
          : Master.fromJson(json['master'] as Map<String, dynamic>),
      json['message'],
    );

Map<String, dynamic> _$MasterResponseToJson(MasterResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'master': instance.master,
    };
