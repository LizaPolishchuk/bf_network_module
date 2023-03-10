// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_free_slots_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetFreeSlotsRequest _$GetFreeSlotsRequestFromJson(Map<String, dynamic> json) =>
    GetFreeSlotsRequest(
      json['master_uuid'] as String?,
      json['service_uuid'] as String,
      json['date_from'] as String?,
      json['date_to'] as String?,
    );

Map<String, dynamic> _$GetFreeSlotsRequestToJson(
        GetFreeSlotsRequest instance) =>
    <String, dynamic>{
      'master_uuid': instance.masterId,
      'service_uuid': instance.serviceId,
      'date_from': instance.dateFrom,
      'date_to': instance.dateTo,
    };
