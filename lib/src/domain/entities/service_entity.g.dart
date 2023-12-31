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
      fields[2] as dynamic,
      fields[3] as double?,
      fields[4] as String?,
      fields[5] as String?,
      fields[6] as String?,
      fields[7] as int?,
      fields[8] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, Service obj) {
    writer
      ..writeByte(9)
      ..writeByte(3)
      ..write(obj.price)
      ..writeByte(4)
      ..write(obj.creatorSalon)
      ..writeByte(5)
      ..write(obj.categoryId)
      ..writeByte(6)
      ..write(obj.categoryName)
      ..writeByte(7)
      ..write(obj.categoryColor)
      ..writeByte(8)
      ..write(obj.duration)
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
      identical(this, other) || other is ServiceAdapter && runtimeType == other.runtimeType && typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Service _$ServiceFromJson(Map<String, dynamic> json) => Service(
      json['id'],
      json['name'],
      json['description'],
      (json['price'] as num?)?.toDouble(),
      json['creatorSalon'] as String?,
      json['categoryId'] as String?,
      json['categoryName'] as String?,
      json['categoryColor'] as int?,
      json['duration'] as int?,
    );

Map<String, dynamic> _$ServiceToJson(Service instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'price': instance.price,
      'creatorSalon': instance.creatorSalon,
      'categoryId': instance.categoryId,
      'categoryName': instance.categoryName,
      'categoryColor': instance.categoryColor,
      'duration': instance.duration,
    };
