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
      fields[2] as dynamic,
      fields[3] as String?,
      fields[4] as String?,
      fields[5] as String?,
      fields[6] as bool?,
    );
  }

  @override
  void write(BinaryWriter writer, Salon obj) {
    writer
      ..writeByte(7)
      ..writeByte(3)
      ..write(obj.photo)
      ..writeByte(4)
      ..write(obj.photoPath)
      ..writeByte(5)
      ..write(obj.ownerId)
      ..writeByte(6)
      ..write(obj.isTop)
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
    json['description'],
    json['photo'] as String?,
    json['photoPath'] as String?,
    json['ownerId'] as String?,
    json['isTop'] as bool?,
  );
}

Map<String, dynamic> _$SalonToJson(Salon instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'photo': instance.photo,
      'photoPath': instance.photoPath,
      'ownerId': instance.ownerId,
      'isTop': instance.isTop,
    };
