import 'package:json_annotation/json_annotation.dart';
import 'package:salons_app_flutter_module/salons_app_flutter_module.dart';
import 'package:salons_app_flutter_module/src/domain/entities/responses/base_response.dart';

part 'user_response.g.dart';

@JsonSerializable()
class UserResponse extends BaseResponse{
  final UserEntity? user;

  UserResponse(this.user, message) : super(message);

  factory UserResponse.fromJson(Map<String, dynamic> json) {
    return _$UserResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$UserResponseToJson(this);

}