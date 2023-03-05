// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feedback_entity.dart';

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
