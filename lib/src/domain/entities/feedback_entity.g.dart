// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feedback_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FeedbackEntityAdapter extends TypeAdapter<FeedbackEntity> {
  @override
  final int typeId = 9;

  @override
  FeedbackEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FeedbackEntity(
      fields[0] as dynamic,
      fields[1] as dynamic,
      fields[2] as dynamic,
      fields[4] as String,
      fields[3] as String?,
      fields[5] as String,
      fields[6] as DateTime,
      fields[7] as int,
    );
  }

  @override
  void write(BinaryWriter writer, FeedbackEntity obj) {
    writer
      ..writeByte(8)
      ..writeByte(3)
      ..write(obj.authorAvatar)
      ..writeByte(4)
      ..write(obj.authorName)
      ..writeByte(5)
      ..write(obj.feedbackText)
      ..writeByte(6)
      ..write(obj.date)
      ..writeByte(7)
      ..write(obj.points)
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
      other is FeedbackEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FeedbackEntity _$FeedbackEntityFromJson(Map<String, dynamic> json) =>
    FeedbackEntity(
      json['id'],
      json['name'],
      json['description'],
      json['authorName'] as String,
      json['authorAvatar'] as String?,
      json['text'] as String,
      DateTime.parse(json['date'] as String),
      json['rate'] as int,
    );

Map<String, dynamic> _$FeedbackEntityToJson(FeedbackEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'authorAvatar': instance.authorAvatar,
      'authorName': instance.authorName,
      'text': instance.feedbackText,
      'date': instance.date.toIso8601String(),
      'rate': instance.points,
    };
