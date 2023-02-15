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
      id: fields[0] as dynamic,
      name: fields[1] as dynamic,
      description: fields[2] as dynamic,
      promoType: fields[6] as String,
      discount: fields[4] as int?,
      color: fields[3] as int?,
      expiredDate: fields[7] as String?,
      creatorSalon: fields[5] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, BonusCard obj) {
    writer
      ..writeByte(8)
      ..writeByte(3)
      ..write(obj.color)
      ..writeByte(4)
      ..write(obj.discount)
      ..writeByte(5)
      ..write(obj.creatorSalon)
      ..writeByte(6)
      ..write(obj.promoType)
      ..writeByte(7)
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
      other is BonusCardAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BonusCard _$BonusCardFromJson(Map<String, dynamic> json) => BonusCard(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      promoType: json['promo_type'] as String,
      discount: json['discount'] as int?,
      color: json['color'] as int?,
      expiredDate: json['day_expire'] as String?,
      creatorSalon: json['salon_uuid'] as String?,
    );

Map<String, dynamic> _$BonusCardToJson(BonusCard instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'color': instance.color,
      'discount': instance.discount,
      'salon_uuid': instance.creatorSalon,
      'promo_type': instance.promoType,
      'day_expire': instance.expiredDate,
    };
