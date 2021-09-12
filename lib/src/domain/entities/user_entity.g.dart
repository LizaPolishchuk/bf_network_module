// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserEntityAdapter extends TypeAdapter<UserEntity> {
  @override
  final int typeId = 1;

  @override
  UserEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserEntity(
      fields[0] as String,
      fields[1] as String?,
      fields[2] as String?,
      fields[3] as String?,
      fields[4] as String?,
      fields[5] as int?,
      isActivated: fields[7] as bool?,
      isRegistered: fields[8] as bool?,
    )..isAdmin = fields[6] as bool?;
  }

  @override
  void write(BinaryWriter writer, UserEntity obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.email)
      ..writeByte(3)
      ..write(obj.avatar)
      ..writeByte(4)
      ..write(obj.phone)
      ..writeByte(5)
      ..write(obj.gender)
      ..writeByte(6)
      ..write(obj.isAdmin)
      ..writeByte(7)
      ..write(obj.isActivated)
      ..writeByte(8)
      ..write(obj.isRegistered);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserEntity _$UserEntityFromJson(Map<String, dynamic> json) {
  return UserEntity(
    json['id'] as String,
    json['name'] as String?,
    json['email'] as String?,
    json['avatar'] as String?,
    json['phone'] as String?,
    json['gender'] as int?,
    isActivated: json['isActivated'] as bool?,
    isRegistered: json['isRegistered'] as bool? ?? true,
  )..isAdmin = json['isAdmin'] as bool? ?? false;
}

Map<String, dynamic> _$UserEntityToJson(UserEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'avatar': instance.avatar,
      'phone': instance.phone,
      'gender': instance.gender,
      'isAdmin': instance.isAdmin,
      'isActivated': instance.isActivated,
      'isRegistered': instance.isRegistered,
    };
