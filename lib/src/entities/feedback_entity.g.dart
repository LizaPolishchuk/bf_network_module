// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feedback_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FeedbackEntity _$FeedbackEntityFromJson(Map<String, dynamic> json) =>
    FeedbackEntity(
      id: json['uuid'],
      authorName: json['authorName'] as String,
      authorAvatar: json['authorAvatar'] as String?,
      feedbackText: json['text'] as String,
      timeStamp: json['date'] as int,
      points: json['rate'] as int,
    );

Map<String, dynamic> _$FeedbackEntityToJson(FeedbackEntity instance) =>
    <String, dynamic>{
      'uuid': instance.id,
      'authorAvatar': instance.authorAvatar,
      'authorName': instance.authorName,
      'text': instance.feedbackText,
      'date': instance.timeStamp,
      'rate': instance.points,
    };
