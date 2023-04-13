// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Client _$ClientFromJson(Map<String, dynamic> json) => Client(
      id: json['uuid'],
      name: json['name'] as String,
      photoUrl: json['photoUrl'] as String?,
      city: json['city'] as String?,
      status: json['status'] as String?,
      phone: json['phone'] as String?,
      services: (json['services'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String),
      ),
      creatorSalon: json['creatorSalon'] as String?,
    );

Map<String, dynamic> _$ClientToJson(Client instance) => <String, dynamic>{
      'uuid': instance.id,
      'name': instance.name,
      'photoUrl': instance.photoUrl,
      'city': instance.city,
      'status': instance.status,
      'phone': instance.phone,
      'services': instance.services,
      'creatorSalon': instance.creatorSalon,
    };
