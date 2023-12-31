import 'package:json_annotation/json_annotation.dart';
import 'package:bf_network_module/src/domain/entities/responses/salon_response.dart';
import 'package:bf_network_module/src/domain/entities/responses/tokens_response.dart';

import '../../../../bf_network_module.dart';
import '../user_entity.dart';

part 'auth_response.g.dart';

@JsonSerializable()
class AuthResponse extends TokensResponse {
  final UserEntity? user;
  @JsonKey(name: "data")
  final SalonResponse? salonData;
  final bool? creator;

  AuthResponse(this.user, this.salonData, this.creator, accessToken, refreshToken, message)
      : super(accessToken, refreshToken, message);

  factory AuthResponse.fromJson(Map<String, dynamic> json) {
    return _$AuthResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AuthResponseToJson(this);
}
