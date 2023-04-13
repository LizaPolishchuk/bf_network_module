// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'salon_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Salon _$SalonFromJson(Map<String, dynamic> json) => Salon(
      id: json['uuid'] ?? "",
      name: json['name'] as String,
      description: json['description'] as String,
      adminId: json['admin_uuid'] as String?,
      photo: json['photo_url'] as String?,
      email: json['email'] as String?,
      city: json['city'] as String?,
      country: json['country'] as String?,
      address: json['address'] as String?,
      timezone: json['timezone'] as String?,
      phoneNumber: json['phone_number'] as String,
    );

Map<String, dynamic> _$SalonToJson(Salon instance) => <String, dynamic>{
      'uuid': instance.id,
      'name': instance.name,
      'admin_uuid': instance.adminId,
      'description': instance.description,
      'photo_url': instance.photo,
      'email': instance.email,
      'city': instance.city,
      'country': instance.country,
      'timezone': instance.timezone,
      'address': instance.address,
      'phone_number': instance.phoneNumber,
    };
