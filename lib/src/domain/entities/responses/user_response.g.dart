// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserResponse _$UserResponseFromJson(Map<String, dynamic> json) => UserResponse(
      json['user'] == null ? null : UserEntity.fromJson(json['user'] as Map<String, dynamic>),
      json['message'],
    );

Map<String, dynamic> _$UserResponseToJson(UserResponse instance) => <String, dynamic>{
      'message': instance.message,
      'user': instance.user,
    };
