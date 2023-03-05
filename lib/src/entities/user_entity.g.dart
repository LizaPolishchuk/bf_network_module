// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserEntity _$UserEntityFromJson(Map<String, dynamic> json) => UserEntity(
      id: json['id'] as String,
      firstname: json['firstname'] as String,
      lastname: json['lastname'] as String,
      phone: json['phone_number'] as String,
      email: json['email'] as String?,
      avatar: json['photo_url'] as String?,
      city: json['city'] as String?,
      country: json['country'] as String?,
      locale: json['locale'] as String,
      gender: json['gender'] as String,
    );

Map<String, dynamic> _$UserEntityToJson(UserEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'firstname': instance.firstname,
      'lastname': instance.lastname,
      'email': instance.email,
      'phone_number': instance.phone,
      'city': instance.city,
      'country': instance.country,
      'locale': instance.locale,
      'photo_url': instance.avatar,
      'gender': instance.gender,
    };
