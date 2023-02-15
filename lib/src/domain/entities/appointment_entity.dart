import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:salons_app_flutter_module/src/data/caches/local_starage.dart';

part 'appointment_entity.g.dart';

enum AppointmentForType { USER, SALON, MASTER, SERVICE }

@HiveType(typeId: hiveTypeAppointments)
@JsonSerializable()
class AppointmentEntity {
  @HiveField(0)
  final String id;
  @HiveField(1)
  @JsonKey(name: "service_name")
  final String serviceName;
  @HiveField(2)
  @JsonKey(name: "service_duration")
  final int? serviceDuration;
  @HiveField(3)
  @JsonKey(name: "master_name")
  final String masterName;
  @HiveField(4)
  @JsonKey(name: "master_photo")
  final String? masterPhoto;
  @HiveField(5)
  @JsonKey(name: "client_firstname")
  final String? clientFirstname;
  @HiveField(6)
  @JsonKey(name: "client_lastname")
  final String? clientLastname;
  @HiveField(7)
  @JsonKey(name: "start_time")
  final String startTime;
  @HiveField(8)
  @JsonKey(name: "service_color")
  final int? serviceColor;
  @HiveField(9)
  @JsonKey(name: "salonName")
  final String? salonName;
  @HiveField(10)
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

  // @HiveField(3)
  // String salonId;
  // @HiveField(4)
  // String salonName;
  // @HiveField(5)
  // String masterId;
  // @HiveField(6)
  // String masterName;
  // @HiveField(7)
  // String? masterAvatar;
  // @HiveField(8)
  // String serviceId;
  // @HiveField(9)
  // String serviceName;
  // @HiveField(10)
  // DateTime date;
  // @HiveField(11)
  // int durationInMin;
  // @HiveField(12)
  // int? categoryColor;
  // @HiveField(13)
  // @JsonKey(ignore: true)
  // bool isPinned;

  factory AppointmentEntity.fromJson(Map<String, dynamic> json) => _$AppointmentEntityFromJson(json);

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
