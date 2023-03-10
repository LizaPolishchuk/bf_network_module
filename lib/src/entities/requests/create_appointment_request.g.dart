// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_appointment_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateAppointmentRequest _$CreateAppointmentRequestFromJson(
        Map<String, dynamic> json) =>
    CreateAppointmentRequest(
      json['master_uuid'] as String,
      json['service_uuid'] as String,
      json['user_uuid'] as String,
      json['start_time'] as int,
    );

Map<String, dynamic> _$CreateAppointmentRequestToJson(
        CreateAppointmentRequest instance) =>
    <String, dynamic>{
      'master_uuid': instance.masterId,
      'service_uuid': instance.serviceId,
      'user_uuid': instance.userId,
      'start_time': instance.startTime,
    };
