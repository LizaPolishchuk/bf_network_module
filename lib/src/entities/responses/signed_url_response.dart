import 'package:json_annotation/json_annotation.dart';
import 'package:bf_network_module/src/entities/responses/base_response.dart';

part 'signed_url_response.g.dart';

@JsonSerializable()
class SignedUrlResponse extends BaseResponse{
  final String path;

  SignedUrlResponse(String? uuid, String? detail, this.path) : super(uuid, detail);


  factory SignedUrlResponse.fromJson(Map<String, dynamic> json) {
    return _$SignedUrlResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SignedUrlResponseToJson(this);

}