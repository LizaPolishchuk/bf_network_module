import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class LikeSalonRequest {
  @JsonKey(name: "user_uuid")
  final String userId;
  @JsonKey(name: "salon_uuid")
  final String salonId;
  final int sign;

  LikeSalonRequest(this.userId, this.salonId, this.sign);
}
