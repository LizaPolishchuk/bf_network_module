// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthResponse _$AuthResponseFromJson(Map<String, dynamic> json) {
  return AuthResponse(
    json['user'] == null
        ? null
        : UserEntity.fromJson(json['user'] as Map<String, dynamic>),
    json['salon'] == null
        ? null
        : Salon.fromJson(json['salon'] as Map<String, dynamic>),
    json['creator'] as bool?,
    json['accessToken'],
    json['refreshToken'],
    json['message'],
  );
}

Map<String, dynamic> _$AuthResponseToJson(AuthResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
      'user': instance.user,
      'salon': instance.salon,
      'creator': instance.creator,
    };
