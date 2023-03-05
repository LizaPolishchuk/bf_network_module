
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class GetFreeSlotsRequest {
  @JsonKey(name: "master_uuid")
  final String? masterId;
  @JsonKey(name: "service_uuid")
  final String serviceId;
  @JsonKey(name: "date_from")
  final String? dateFrom;
  @JsonKey(name: "date_to")
  final String? dateTo;

  GetFreeSlotsRequest(this.masterId, this.serviceId, this.dateFrom, this.dateTo);
}