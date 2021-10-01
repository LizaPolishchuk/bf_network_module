import 'package:json_annotation/json_annotation.dart';
import 'package:salons_app_flutter_module/src/domain/entities/responses/base_response.dart';

part 'tokens_response.g.dart';

@JsonSerializable()
class TokensResponse extends BaseResponse {
  @JsonKey(defaultValue: "")
  final String accessToken;
  @JsonKey(defaultValue: "")
  final String refreshToken;

  TokensResponse(this.accessToken, this.refreshToken, message) : super(message);

  factory TokensResponse.fromJson(Map<String, dynamic> json) {
    return _$TokensResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$TokensResponseToJson(this);
}
