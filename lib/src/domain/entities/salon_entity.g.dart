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
      fields[6] as String?,
      fields[7] as String?,
      fields[8] as bool?,
      fields[9] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, Salon obj) {
    writer
      ..writeByte(10)
      ..writeByte(3)
      ..write(obj.photo)
      ..writeByte(4)
      ..write(obj.photoPath)
      ..writeByte(5)
      ..write(obj.ownerId)
      ..writeByte(6)
      ..write(obj.address)
      ..writeByte(7)
      ..write(obj.phoneNumber)
      ..writeByte(8)
      ..write(obj.isTop)
      ..writeByte(9)
      ..write(obj.isFavourite)
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
      identical(this, other) || other is SalonAdapter && runtimeType == other.runtimeType && typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Salon _$SalonFromJson(Map<String, dynamic> json) => Salon(
      json['id'],
      json['name'],
      json['description'],
      json['photo'] as String?,
      json['photoPath'] as String?,
      json['ownerId'] as String?,
      json['address'] as String?,
      json['phoneNumber'] as String?,
      json['isTop'] as bool?,
      json['isFavourite'] as bool? ?? false,
    );

Map<String, dynamic> _$SalonToJson(Salon instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'photo': instance.photo,
      'photoPath': instance.photoPath,
      'ownerId': instance.ownerId,
      'address': instance.address,
      'phoneNumber': instance.phoneNumber,
      'isTop': instance.isTop,
      'isFavourite': instance.isFavourite,
    };
