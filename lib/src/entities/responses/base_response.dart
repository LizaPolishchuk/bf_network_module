import 'package:json_annotation/json_annotation.dart';

part 'base_response.g.dart';

@JsonSerializable()
class BaseResponse {
  final String? uuid;
  final String? detail;

  BaseResponse(this.uuid, this.detail);

  factory BaseResponse.fromJson(Map<String, dynamic> json) {
    return _$BaseResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$BaseResponseToJson(this);


// factory BaseResponseNew.fromJson(Map<String, dynamic> json) {
  //   return _$BaseResponseFromJson(json);
  // }
  //
  // Map<String, dynamic> toJson() => _$BaseResponseToJson(this);
}
