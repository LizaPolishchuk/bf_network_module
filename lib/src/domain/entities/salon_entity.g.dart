// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'salon_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SalonAdapter extends TypeAdapter<Salon> {
  @override
  final int typeId = 0;

  @override
  Salon read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Salon(
      fields[0] as dynamic,
      fields[1] as dynamic,
      fields[2] as String?,
      fields[3] as String?,
      fields[4] as String?,
      (fields[5] as List?)?.cast<Master>(),
      (fields[6] as List?)?.cast<Service>(),
      fields[7] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Salon obj) {
    writer
      ..writeByte(8)
      ..writeByte(2)
      ..write(obj.photo)
      ..writeByte(3)
      ..write(obj.photoPath)
      ..writeByte(4)
      ..write(obj.ownerId)
      ..writeByte(5)
      ..write(obj.mastersList)
      ..writeByte(6)
      ..write(obj.servicesList)
      ..writeByte(7)
      ..write(obj.description)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SalonAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Salon _$SalonFromJson(Map<String, dynamic> json) {
  return Salon(
    json['id'],
    json['name'],
    json['photo'] as String?,
    json['photoPath'] as String?,
    json['ownerId'] as String?,
    (json['mastersList'] as List<dynamic>?)
        ?.map((e) => Master.fromJson(e as Map<String, dynamic>))
        .toList(),
    (json['servicesList'] as List<dynamic>?)
        ?.map((e) => Service.fromJson(e as Map<String, dynamic>))
        .toList(),
    json['description'] as String?,
  );
}

Map<String, dynamic> _$SalonToJson(Salon instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'photo': instance.photo,
      'photoPath': instance.photoPath,
      'ownerId': instance.ownerId,
      'mastersList': instance.mastersList,
      'servicesList': instance.servicesList,
      'description': instance.description,
    };
