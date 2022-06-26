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
      fields[0] as dynamic,
      fields[1] as dynamic,
      fields[2] as dynamic,
      fields[3] as String?,
      fields[4] as String?,
      fields[5] as String?,
      (fields[6] as List).cast<String>(),
      (fields[7] as Map?)?.cast<String, String>(),
      fields[8] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Master obj) {
    writer
      ..writeByte(9)
      ..writeByte(3)
      ..write(obj.avatar)
      ..writeByte(4)
      ..write(obj.avatarPath)
      ..writeByte(5)
      ..write(obj.position)
      ..writeByte(6)
      ..write(obj.workedInSalons)
      ..writeByte(7)
      ..write(obj.providedServices)
      ..writeByte(8)
      ..write(obj.status)
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
      json['id'],
      json['name'],
      json['description'],
      json['avatar'] as String?,
      json['avatarPath'] as String?,
      json['position'] as String?,
      (json['workedInSalons'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      (json['providedServices'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String),
      ),
      json['status'] as String?,
    );

Map<String, dynamic> _$MasterToJson(Master instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'avatar': instance.avatar,
      'avatarPath': instance.avatarPath,
      'position': instance.position,
      'workedInSalons': instance.workedInSalons,
      'providedServices': instance.providedServices,
      'status': instance.status,
    };
