import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:salons_app_flutter_module/src/data/caches/local_starage.dart';

import 'base_entity.dart';

part 'feedback_entity.g.dart';

@HiveType(typeId: hiveTypeFeedback)
@JsonSerializable()
class FeedbackEntity extends BaseEntity {
  @HiveField(3)
  String? authorAvatar;
  @HiveField(4)
  String authorName;
  @HiveField(5)
  @JsonKey(name: "text")
  String feedbackText;
  @HiveField(6)
  DateTime date;
  @HiveField(7)
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
