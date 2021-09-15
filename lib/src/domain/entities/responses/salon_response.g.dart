// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'salon_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SalonResponse _$SalonResponseFromJson(Map<String, dynamic> json) {
  return SalonResponse(
    json['salon'] == null
        ? null
        : Salon.fromJson(json['salon'] as Map<String, dynamic>),
    (json['masters'] as List<dynamic>?)
        ?.map((e) => Master.fromJson(e as Map<String, dynamic>))
        .toList(),
    (json['services'] as List<dynamic>?)
        ?.map((e) => Service.fromJson(e as Map<String, dynamic>))
        .toList(),
    json['message'],
  );
}

Map<String, dynamic> _$SalonResponseToJson(SalonResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'salon': instance.salon,
      'masters': instance.masters,
      'services': instance.services,
    };
