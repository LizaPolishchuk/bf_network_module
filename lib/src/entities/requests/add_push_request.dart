import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class AddPushRequest {
  @JsonKey(name: "user_uuid")
  final String userId;
  @JsonKey(name: "appointment_uuid")
  final String appointmentId;
  final List<int> time;

  AddPushRequest(this.userId, this.appointmentId, this.time);
}
