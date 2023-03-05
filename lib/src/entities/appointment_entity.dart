import 'package:json_annotation/json_annotation.dart';

part 'appointment_entity.g.dart';

@JsonSerializable()
class AppointmentEntity {
  
  final String id;
  
  @JsonKey(name: "service_name")
  final String serviceName;
  
  @JsonKey(name: "service_duration")
  final int? serviceDuration;
  
  @JsonKey(name: "master_name")
  final String masterName;
  
  @JsonKey(name: "master_photo")
  final String? masterPhoto;
  
  @JsonKey(name: "client_firstname")
  final String? clientFirstname;
  
  @JsonKey(name: "client_lastname")
  final String? clientLastname;

  @JsonKey(name: "start_time")
  final String startTime;

  @JsonKey(name: "service_color")
  final int? serviceColor;

  @JsonKey(name: "salonName")
  final String? salonName;

  @JsonKey(name: "service_price")
  final double? servicePrice;

  AppointmentEntity(
      {required this.id,
      required this.serviceName,
      this.serviceDuration,
      required this.masterName,
      this.masterPhoto,
      this.clientFirstname,
      this.clientLastname,
      required this.startTime,
      this.serviceColor,
      this.salonName,
      this.servicePrice});


  factory AppointmentEntity.fromJson(Map<String, dynamic> json) {
    return _$AppointmentEntityFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AppointmentEntityToJson(this);


  AppointmentEntity copy({
    String? serviceName,
    int? serviceDuration,
    String? masterName,
    String? masterPhoto,
    String? clientFirstname,
    String? clientLastname,
    String? startTime,
    int? serviceColor,
    String? salonName,
    double? servicePrice,
  }) {
    return AppointmentEntity(
        id: this.id,
        serviceName: serviceName ?? this.serviceName,
        serviceDuration: serviceDuration ?? this.serviceDuration,
        masterName: masterName ?? this.masterName,
        masterPhoto: masterPhoto ?? this.masterPhoto,
        clientFirstname: clientFirstname ?? this.clientFirstname,
        clientLastname: clientLastname ?? this.clientLastname,
        startTime: startTime ?? this.startTime,
        serviceColor: serviceColor ?? this.serviceColor,
        salonName: salonName ?? this.salonName,
        servicePrice: servicePrice ?? this.servicePrice);
  }

  @override
  int get hashCode {
    return id.hashCode;
  }

  @override
  bool operator ==(Object other) {
    return (other as AppointmentEntity).id == this.id;
  }
}
