import 'package:json_annotation/json_annotation.dart';

part 'like_salon_request.g.dart';

@JsonSerializable()
class LikeSalonRequest {
  @JsonKey(name: "user_uuid")
  final String userId;
  @JsonKey(name: "salon_uuid")
  final String salonId;
  final int sign;

  LikeSalonRequest(this.userId, this.salonId, this.sign);

  factory LikeSalonRequest.fromJson(Map<String, dynamic> json) {
    return _$LikeSalonRequestFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$LikeSalonRequestToJson(this);
  }
}
