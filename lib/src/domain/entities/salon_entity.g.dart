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
      id: fields[0] as dynamic,
      name: fields[1] as dynamic,
      description: fields[2] as dynamic,
      photo: fields[3] as String?,
      email: fields[4] as String?,
      city: fields[5] as String?,
      country: fields[6] as String?,
      address: fields[8] as String?,
      locale: fields[7] as String,
      phoneNumber: fields[9] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Salon obj) {
    writer
      ..writeByte(10)
      ..writeByte(3)
      ..write(obj.photo)
      ..writeByte(4)
      ..write(obj.email)
      ..writeByte(5)
      ..write(obj.city)
      ..writeByte(6)
      ..write(obj.country)
      ..writeByte(7)
      ..write(obj.locale)
      ..writeByte(8)
      ..write(obj.address)
      ..writeByte(9)
      ..write(obj.phoneNumber)
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

Salon _$SalonFromJson(Map<String, dynamic> json) => Salon(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      photo: json['photo_url'] as String?,
      email: json['email'] as String?,
      city: json['city'] as String?,
      country: json['country'] as String?,
      address: json['address'] as String?,
      locale: json['locale'] as String,
      phoneNumber: json['phone_number'] as String,
    );

Map<String, dynamic> _$SalonToJson(Salon instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'photo_url': instance.photo,
      'email': instance.email,
      'city': instance.city,
      'country': instance.country,
      'locale': instance.locale,
      'address': instance.address,
      'phone_number': instance.phoneNumber,
    };
