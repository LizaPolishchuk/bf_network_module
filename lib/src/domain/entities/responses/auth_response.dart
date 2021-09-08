import 'package:json_annotation/json_annotation.dart';
import 'package:salons_app_flutter_module/src/domain/entities/responses/tokens_response.dart';

import '../../../../salons_app_flutter_module.dart';
import '../user_entity.dart';

part 'auth_response.g.dart';

@JsonSerializable()
class AuthResponse extends TokensResponse {
  final UserEntity? user;
  final Salon? salon;

  AuthResponse(this.user, this.salon, accessToken, refreshToken, message)
      : super(accessToken, refreshToken, message);

  factory AuthResponse.fromJson(Map<String, dynamic> json) {
    return _$AuthResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AuthResponseToJson(this);
}

