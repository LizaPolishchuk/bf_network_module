import 'package:json_annotation/json_annotation.dart';

import 'base_entity.dart';

part 'feedback_entity.g.dart';

@JsonSerializable()
class FeedbackEntity extends BaseEntity {
  String? authorAvatar;

  String authorName;

  @JsonKey(name: "text")
  String feedbackText;

  int date;

  @JsonKey(name: "rate")
  int points;

  FeedbackEntity(
      {id,
      required this.authorName,
      this.authorAvatar,
      required this.feedbackText,
      required this.date,
      required this.points})
      : super(id);

  factory FeedbackEntity.fromJson(Map<String, dynamic> json) => _$FeedbackEntityFromJson(json);

  Map<String, dynamic> toJson() => _$FeedbackEntityToJson(this);

  FeedbackEntity copy({String? authorName, String? authorAvatar, String? feedbackText, int? date, int? points}) {
    return FeedbackEntity(
        id: id,
        authorName: authorName ?? this.authorName,
        authorAvatar: authorAvatar ?? this.authorAvatar,
        feedbackText: feedbackText ?? this.feedbackText,
        date: date ?? this.date,
        points: points ?? this.points);
  }

  @override
  int get hashCode => id.hashCode;

  @override
  bool operator ==(Object other) {
    return id == (other as FeedbackEntity).id;
  }
}
