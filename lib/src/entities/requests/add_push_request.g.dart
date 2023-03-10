// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_push_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddPushRequest _$AddPushRequestFromJson(Map<String, dynamic> json) =>
    AddPushRequest(
      json['user_uuid'] as String,
      json['appointment_uuid'] as String,
      (json['time'] as List<dynamic>).map((e) => e as int).toList(),
    );

Map<String, dynamic> _$AddPushRequestToJson(AddPushRequest instance) =>
    <String, dynamic>{
      'user_uuid': instance.userId,
      'appointment_uuid': instance.appointmentId,
      'time': instance.time,
    };
