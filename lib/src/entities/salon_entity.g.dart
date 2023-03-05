// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'salon_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Salon _$SalonFromJson(Map<String, dynamic> json) => Salon(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      photo: json['photo_url'] as String?,
      email: json['email'] as String?,
      city: json['city'] as String?,
      country: json['country'] as String?,
      address: json['address'] as String?,
      locale: json['locale'] as String,
      phoneNumber: json['phone_number'] as String,
    );

Map<String, dynamic> _$SalonToJson(Salon instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'photo_url': instance.photo,
      'email': instance.email,
      'city': instance.city,
      'country': instance.country,
      'locale': instance.locale,
      'address': instance.address,
      'phone_number': instance.phoneNumber,
    };
