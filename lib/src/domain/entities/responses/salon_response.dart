import 'package:json_annotation/json_annotation.dart';
import 'package:bf_network_module/bf_network_module.dart';
import 'package:bf_network_module/src/domain/entities/responses/base_response.dart';

part 'salon_response.g.dart';

@JsonSerializable()
class SalonResponse extends BaseResponse {
  final Salon? salon;
  final List<Master>? masters;
  final List<Service>? services;

  SalonResponse(this.salon, this.masters, this.services, message) : super(message);

  factory SalonResponse.fromJson(Map<String, dynamic> json) {
    return _$SalonResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SalonResponseToJson(this);
}
