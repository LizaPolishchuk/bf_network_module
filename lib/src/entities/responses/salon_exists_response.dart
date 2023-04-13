import 'package:bf_network_module/src/entities/responses/base_response.dart';

class SalonExistsResponse extends BaseResponse {
  final bool exist;

  SalonExistsResponse(String? uuid, String? detail, this.exist) : super(uuid, detail);

  factory SalonExistsResponse.fromJson(Map<String, dynamic> json) {
    return SalonExistsResponse(
      json['uuid'] as String?,
      json['detail'] as String?,
      json['exist'] as bool,
    );
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'uuid': uuid,
        'detail': detail,
        'exist': exist,
      };
}
