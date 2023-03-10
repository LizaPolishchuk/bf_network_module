// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appointment_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppointmentEntity _$AppointmentEntityFromJson(Map<String, dynamic> json) =>
    AppointmentEntity(
      id: json['id'] as String,
      serviceName: json['service_name'] as String,
      serviceDuration: json['service_duration'] as int,
      masterName: json['master_name'] as String,
      masterPhoto: json['master_photo'] as String?,
      clientFirstname: json['client_firstname'] as String?,
      clientLastname: json['client_lastname'] as String?,
      startTime: json['start_time'] as int,
      serviceColor: json['service_color'] as int?,
      salonName: json['salonName'] as String?,
      servicePrice: (json['service_price'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$AppointmentEntityToJson(AppointmentEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'service_name': instance.serviceName,
      'service_duration': instance.serviceDuration,
      'master_name': instance.masterName,
      'master_photo': instance.masterPhoto,
      'client_firstname': instance.clientFirstname,
      'client_lastname': instance.clientLastname,
      'start_time': instance.startTime,
      'service_color': instance.serviceColor,
      'salonName': instance.salonName,
      'service_price': instance.servicePrice,
    };
