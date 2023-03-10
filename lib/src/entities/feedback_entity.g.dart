// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feedback_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FeedbackEntity _$FeedbackEntityFromJson(Map<String, dynamic> json) =>
    FeedbackEntity(
      id: json['id'],
      authorName: json['authorName'] as String,
      authorAvatar: json['authorAvatar'] as String?,
      feedbackText: json['text'] as String,
      date: DateTime.parse(json['date'] as String),
      points: json['rate'] as int,
    );

Map<String, dynamic> _$FeedbackEntityToJson(FeedbackEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'authorAvatar': instance.authorAvatar,
      'authorName': instance.authorName,
      'text': instance.feedbackText,
      'date': instance.date.toIso8601String(),
      'rate': instance.points,
    };
