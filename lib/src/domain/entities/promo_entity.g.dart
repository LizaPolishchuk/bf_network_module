// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'promo_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PromoAdapter extends TypeAdapter<Promo> {
  @override
  final int typeId = 7;

  @override
  Promo read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Promo(
      fields[0] as dynamic,
      fields[1] as dynamic,
      fields[2] as dynamic,
      fields[3] as String?,
      fields[4] as DateTime?,
    );
  }

  @override
  void write(BinaryWriter writer, Promo obj) {
    writer
      ..writeByte(5)
      ..writeByte(3)
      ..write(obj.photoUrl)
      ..writeByte(4)
      ..write(obj.expiredDate)
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
      other is PromoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Promo _$PromoFromJson(Map<String, dynamic> json) => Promo(
      json['id'],
      json['name'],
      json['description'],
      json['photoUrl'] as String?,
      json['expiredDate'] == null
          ? null
          : DateTime.parse(json['expiredDate'] as String),
    );

Map<String, dynamic> _$PromoToJson(Promo instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'photoUrl': instance.photoUrl,
      'expiredDate': instance.expiredDate?.toIso8601String(),
    };
