// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'master_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Master _$MasterFromJson(Map<String, dynamic> json) => Master(
      id: json['uuid'],
      name: json['name'],
      avatar: json['photo_url'] as String?,
      position: json['position'] as String?,
      status: json['status'] as String?,
      firstname: json['firstname'] as String,
      lastname: json['lastname'] as String,
      email: json['email'] as String?,
      country: json['country'] as String?,
      city: json['city'] as String?,
      locale: json['locale'] as String,
      gender: json['gender'] as String,
      startWorkTime: json['start_work_time'] as String,
      endWorkTime: json['end_work_time'] as String,
      phoneNumber: json['phone_number'] as String,
      services: (json['services'] as List<dynamic>?)
          ?.map((e) => Service.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MasterToJson(Master instance) => <String, dynamic>{
      'uuid': instance.id,
      'firstname': instance.firstname,
      'lastname': instance.lastname,
      'phone_number': instance.phoneNumber,
      'email': instance.email,
      'city': instance.city,
      'country': instance.country,
      'locale': instance.locale,
      'photo_url': instance.avatar,
      'gender': instance.gender,
      'position': instance.position,
      'status': instance.status,
      'start_work_time': instance.startWorkTime,
      'end_work_time': instance.endWorkTime,
      'services': instance.services,
      'name': instance.name,
    };
