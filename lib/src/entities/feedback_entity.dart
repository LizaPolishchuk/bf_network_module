
import 'package:json_annotation/json_annotation.dart';


import 'base_entity.dart';

part 'feedback_entity.g.dart';

@JsonSerializable()
class FeedbackEntity extends BaseEntity {
  
  String? authorAvatar;
  
  String authorName;
  
  @JsonKey(name: "text")
  String feedbackText;
  
  DateTime date;
  
  @JsonKey(name: "rate")
  int points;

  FeedbackEntity(id, name, description, this.authorName, this.authorAvatar, this.feedbackText, this.date, this.points)
      : super(id, name, description);

  factory FeedbackEntity.fromJson(Map<String, dynamic> json) => _$FeedbackEntityFromJson(json);

  Map<String, dynamic> toJson() => _$FeedbackEntityToJson(this);

  FeedbackEntity copy({String? authorName, String? authorAvatar, String? feedback, DateTime? date, int? points}) {
    return FeedbackEntity(id, name, description, authorName ?? this.authorName, authorAvatar ?? this.authorAvatar,
        feedback ?? this.feedbackText, date ?? this.date, points ?? this.points);
  }

  @override
  int get hashCode => id.hashCode;

  @override
  bool operator ==(Object other) {
    return id == (other as FeedbackEntity).id;
  }
}
