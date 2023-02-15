// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'master_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MasterAdapter extends TypeAdapter<Master> {
  @override
  final int typeId = 2;

  @override
  Master read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Master(
      id: fields[0] as dynamic,
      name: fields[1] as dynamic,
      description: fields[2] as dynamic,
      avatar: fields[10] as String?,
      position: fields[12] as String?,
      status: fields[13] as String?,
      firstname: fields[3] as String,
      lastname: fields[4] as String,
      email: fields[6] as String?,
      country: fields[8] as String?,
      city: fields[7] as String?,
      locale: fields[9] as String,
      gender: fields[11] as String,
      startWorkTime: fields[14] as String,
      endWorkTime: fields[15] as String,
      phoneNumber: fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Master obj) {
    writer
      ..writeByte(16)
      ..writeByte(3)
      ..write(obj.firstname)
      ..writeByte(4)
      ..write(obj.lastname)
      ..writeByte(5)
      ..write(obj.phoneNumber)
      ..writeByte(6)
      ..write(obj.email)
      ..writeByte(7)
      ..write(obj.city)
      ..writeByte(8)
      ..write(obj.country)
      ..writeByte(9)
      ..write(obj.locale)
      ..writeByte(10)
      ..write(obj.avatar)
      ..writeByte(11)
      ..write(obj.gender)
      ..writeByte(12)
      ..write(obj.position)
      ..writeByte(13)
      ..write(obj.status)
      ..writeByte(14)
      ..write(obj.startWorkTime)
      ..writeByte(15)
      ..write(obj.endWorkTime)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.description);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MasterAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Master _$MasterFromJson(Map<String, dynamic> json) => Master(
      id: json['id'],
      name: json['name'],
      description: json['description'],
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
    );

Map<String, dynamic> _$MasterToJson(Master instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
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
    };
