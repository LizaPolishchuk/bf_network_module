import 'package:json_annotation/json_annotation.dart';

part 'add_push_request.g.dart';

@JsonSerializable()
class AddPushRequest {
  @JsonKey(name: "user_uuid")
  final String userId;
  @JsonKey(name: "appointment_uuid")
  final String appointmentId;
  final List<int> time;

  AddPushRequest(this.userId, this.appointmentId, this.time);

  factory AddPushRequest.fromJson(Map<String, dynamic> json) {
    return _$AddPushRequestFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$AddPushRequestToJson(this);
  }
}
