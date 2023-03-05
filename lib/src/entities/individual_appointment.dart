
import 'package:json_annotation/json_annotation.dart';


part 'individual_appointment.g.dart';

@JsonSerializable()
class IndividualAppointment {
  
  final String id;
  
  @JsonKey(name: "service_name")
  final String serviceName;
  
  @JsonKey(name: "master_name")
  final String masterName;
  
  @JsonKey(name: "start_time")
  final String startTime;
  
  @JsonKey(name: "salon_name")
  final String? salonName;
  
  @JsonKey(name: "price")
  final double? servicePrice;
  
  @JsonKey(name: "user_uuid")
  final String userId;

  IndividualAppointment(
      {required this.id,
        required this.userId,
        required this.serviceName,
        required this.masterName,
        required this.startTime,
        this.salonName,
        this.servicePrice});

  factory IndividualAppointment.fromJson(Map<String, dynamic> json) => _$IndividualAppointmentFromJson(json);

  Map<String, dynamic> toJson() => _$IndividualAppointmentToJson(this);

  IndividualAppointment copy({
    String? serviceName,
    String? masterName,
    String? userId,
    String? startTime,
    String? salonName,
    double? servicePrice,
  }) {
    return IndividualAppointment(
        id: this.id,
        userId: userId ?? this.userId,
        serviceName: serviceName ?? this.serviceName,
        masterName: masterName ?? this.masterName,
        startTime: startTime ?? this.startTime,
        salonName: salonName ?? this.salonName,
        servicePrice: servicePrice ?? this.servicePrice);
  }

  @override
  int get hashCode {
    return id.hashCode;
  }

  @override
  bool operator ==(Object other) {
    return (other as IndividualAppointment).id == this.id;
  }
}
