// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bonus_card_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BonusCardAdapter extends TypeAdapter<BonusCard> {
  @override
  final int typeId = 8;

  @override
  BonusCard read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BonusCard(
      fields[0] as dynamic,
      fields[1] as dynamic,
      fields[2] as dynamic,
      fields[3] as int?,
      fields[4] as int?,
      fields[5] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, BonusCard obj) {
    writer
      ..writeByte(6)
      ..writeByte(3)
      ..write(obj.color)
      ..writeByte(4)
      ..write(obj.discount)
      ..writeByte(5)
      ..write(obj.creatorSalon)
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
      identical(this, other) || other is BonusCardAdapter && runtimeType == other.runtimeType && typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BonusCard _$BonusCardFromJson(Map<String, dynamic> json) => BonusCard(
      json['id'],
      json['name'],
      json['description'],
      json['color'] as int?,
      json['discount'] as int?,
      json['creatorSalon'] as String?,
    );

Map<String, dynamic> _$BonusCardToJson(BonusCard instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'color': instance.color,
      'discount': instance.discount,
      'creatorSalon': instance.creatorSalon,
    };
