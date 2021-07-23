// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class OrderEntityAdapter extends TypeAdapter<OrderEntity> {
  @override
  final int typeId = 3;

  @override
  OrderEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return OrderEntity(
      fields[0] as String,
      fields[1] as String?,
      fields[2] as String?,
      fields[3] as String,
      fields[4] as String,
      fields[5] as String,
      fields[6] as String,
      fields[7] as String?,
      fields[8] as String,
      fields[9] as String,
      fields[10] as DateTime,
      fields[11] as double,
      fields[12] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, OrderEntity obj) {
    writer
      ..writeByte(13)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.clientId)
      ..writeByte(2)
      ..write(obj.clientName)
      ..writeByte(3)
      ..write(obj.salonId)
      ..writeByte(4)
      ..write(obj.salonName)
      ..writeByte(5)
      ..write(obj.masterId)
      ..writeByte(6)
      ..write(obj.masterName)
      ..writeByte(7)
      ..write(obj.masterAvatar)
      ..writeByte(8)
      ..write(obj.serviceId)
      ..writeByte(9)
      ..write(obj.serviceName)
      ..writeByte(10)
      ..write(obj.date)
      ..writeByte(11)
      ..write(obj.price)
      ..writeByte(12)
      ..write(obj.isPinned);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OrderEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderEntity _$OrderEntityFromJson(Map<String, dynamic> json) {
  return OrderEntity(
    json['id'] as String,
    json['clientId'] as String?,
    json['clientName'] as String?,
    json['salonId'] as String,
    json['salonName'] as String,
    json['masterId'] as String,
    json['masterName'] as String,
    json['masterAvatar'] as String?,
    json['serviceId'] as String,
    json['serviceName'] as String,
    DateTime.parse(json['date'] as String),
    (json['price'] as num).toDouble(),
    json['isPinned'] as bool,
  );
}

Map<String, dynamic> _$OrderEntityToJson(OrderEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'clientId': instance.clientId,
      'clientName': instance.clientName,
      'salonId': instance.salonId,
      'salonName': instance.salonName,
      'masterId': instance.masterId,
      'masterName': instance.masterName,
      'masterAvatar': instance.masterAvatar,
      'serviceId': instance.serviceId,
      'serviceName': instance.serviceName,
      'date': instance.date.toIso8601String(),
      'price': instance.price,
      'isPinned': instance.isPinned,
    };
