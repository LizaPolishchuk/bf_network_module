// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Client _$ClientFromJson(Map<String, dynamic> json) => Client(
      json['id'],
      json['name'] as String,
      json['photoUrl'] as String?,
      json['city'] as String?,
      json['status'] as String?,
      json['phone'] as String?,
      (json['services'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String),
      ),
      json['creatorSalon'] as String?,
    );

Map<String, dynamic> _$ClientToJson(Client instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'photoUrl': instance.photoUrl,
      'city': instance.city,
      'status': instance.status,
      'phone': instance.phone,
      'services': instance.services,
      'creatorSalon': instance.creatorSalon,
    };
