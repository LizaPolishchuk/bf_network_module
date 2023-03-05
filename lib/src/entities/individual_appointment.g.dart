// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'individual_appointment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IndividualAppointment _$IndividualAppointmentFromJson(
        Map<String, dynamic> json) =>
    IndividualAppointment(
      id: json['id'] as String,
      userId: json['user_uuid'] as String,
      serviceName: json['service_name'] as String,
      masterName: json['master_name'] as String,
      startTime: json['start_time'] as String,
      salonName: json['salon_name'] as String?,
      servicePrice: (json['price'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$IndividualAppointmentToJson(
        IndividualAppointment instance) =>
    <String, dynamic>{
      'id': instance.id,
      'service_name': instance.serviceName,
      'master_name': instance.masterName,
      'start_time': instance.startTime,
      'salon_name': instance.salonName,
      'price': instance.servicePrice,
      'user_uuid': instance.userId,
    };
