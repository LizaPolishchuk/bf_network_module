import 'package:json_annotation/json_annotation.dart';
import 'package:salons_app_flutter_module/salons_app_flutter_module.dart';
import 'package:salons_app_flutter_module/src/domain/entities/responses/base_response.dart';

part 'master_response.g.dart';

@JsonSerializable()
class MasterResponse extends BaseResponse {
  final Master? master;

  MasterResponse(this.master, message) : super(message);

  factory MasterResponse.fromJson(Map<String, dynamic> json) {
    return _$MasterResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$MasterResponseToJson(this);
}
