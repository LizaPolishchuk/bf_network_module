import 'package:json_annotation/json_annotation.dart';

part 'headers_payload.g.dart';

@JsonSerializable()
class HeadersPayload {
  final String sub;
  final String type;
  @JsonKey(name: "user_uuid")
  final String userUuid;
  final String expire;
  final String iat;

  HeadersPayload(this.sub, this.type, this.userUuid, this.expire, this.iat);

  factory HeadersPayload.fromJson(Map<String, dynamic> json) {
    return _$HeadersPayloadFromJson(json);
  }

  Map<String, dynamic> toJson() => _$HeadersPayloadToJson(this);
}
