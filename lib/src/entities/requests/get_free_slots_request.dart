import 'package:json_annotation/json_annotation.dart';

part 'get_free_slots_request.g.dart';

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


  factory GetFreeSlotsRequest.fromJson(Map<String, dynamic> json) {
    return _$GetFreeSlotsRequestFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$GetFreeSlotsRequestToJson(this);
  }
}