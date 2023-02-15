// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appointment_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AppointmentEntityAdapter extends TypeAdapter<AppointmentEntity> {
  @override
  final int typeId = 3;

  @override
  AppointmentEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AppointmentEntity(
      id: fields[0] as String,
      serviceName: fields[1] as String,
      serviceDuration: fields[2] as int?,
      masterName: fields[3] as String,
      masterPhoto: fields[4] as String?,
      clientFirstname: fields[5] as String?,
      clientLastname: fields[6] as String?,
      startTime: fields[7] as String,
      serviceColor: fields[8] as int?,
      salonName: fields[9] as String?,
      servicePrice: fields[10] as double?,
    );
  }

  @override
  void write(BinaryWriter writer, AppointmentEntity obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.serviceName)
      ..writeByte(2)
      ..write(obj.serviceDuration)
      ..writeByte(3)
      ..write(obj.masterName)
      ..writeByte(4)
      ..write(obj.masterPhoto)
      ..writeByte(5)
      ..write(obj.clientFirstname)
      ..writeByte(6)
      ..write(obj.clientLastname)
      ..writeByte(7)
      ..write(obj.startTime)
      ..writeByte(8)
      ..write(obj.serviceColor)
      ..writeByte(9)
      ..write(obj.salonName)
      ..writeByte(10)
      ..write(obj.servicePrice);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppointmentEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppointmentEntity _$AppointmentEntityFromJson(Map<String, dynamic> json) =>
    AppointmentEntity(
      id: json['id'] as String,
      serviceName: json['service_name'] as String,
      serviceDuration: json['service_duration'] as int?,
      masterName: json['master_name'] as String,
      masterPhoto: json['master_photo'] as String?,
      clientFirstname: json['client_firstname'] as String?,
      clientLastname: json['client_lastname'] as String?,
      startTime: json['start_time'] as String,
      serviceColor: json['service_color'] as int?,
      salonName: json['salonName'] as String?,
      servicePrice: (json['service_price'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$AppointmentEntityToJson(AppointmentEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'service_name': instance.serviceName,
      'service_duration': instance.serviceDuration,
      'master_name': instance.masterName,
      'master_photo': instance.masterPhoto,
      'client_firstname': instance.clientFirstname,
      'client_lastname': instance.clientLastname,
      'start_time': instance.startTime,
      'service_color': instance.serviceColor,
      'salonName': instance.salonName,
      'service_price': instance.servicePrice,
    };
