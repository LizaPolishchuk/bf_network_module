import 'package:json_annotation/json_annotation.dart';

part 'create_appointment_request.g.dart';

@JsonSerializable()
class CreateAppointmentRequest {
  @JsonKey(name: "master_uuid")
  final String masterId;
  @JsonKey(name: "service_uuid")
  final String serviceId;
  @JsonKey(name: "user_uuid")
  final String userId;
  @JsonKey(name: "start_time")
  final int startTime;

  CreateAppointmentRequest(this.masterId, this.serviceId, this.userId, this.startTime);

  factory CreateAppointmentRequest.fromJson(Map<String, dynamic> json) {
    return _$CreateAppointmentRequestFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$CreateAppointmentRequestToJson(this);
  }
}
