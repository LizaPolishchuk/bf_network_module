// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ServiceAdapter extends TypeAdapter<Service> {
  @override
  final int typeId = 4;

  @override
  Service read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Service(
      fields[0] as dynamic,
      fields[1] as dynamic,
      fields[2] as double?,
    );
  }

  @override
  void write(BinaryWriter writer, Service obj) {
    writer
      ..writeByte(3)
      ..writeByte(2)
      ..write(obj.price)
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
      other is ServiceAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Service _$ServiceFromJson(Map<String, dynamic> json) {
  return Service(
    json['id'],
    json['name'],
    (json['price'] as num?)?.toDouble(),
  );
}

Map<String, dynamic> _$ServiceToJson(Service instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'price': instance.price,
    };
