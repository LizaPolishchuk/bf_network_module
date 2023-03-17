import 'package:json_annotation/json_annotation.dart';
import 'package:bf_network_module/bf_network_module.dart';

import 'base_entity.dart';

part 'master_entity.g.dart';

enum MasterStatus { active, on_holiday, is_ill }

@JsonSerializable()
class Master extends BaseEntity {
  String firstname;

  String lastname;

  @JsonKey(name: "phone_number")
  String phoneNumber;

  String? email;

  String? city;

  String? country;

  String locale;

  @JsonKey(name: "photo_url")
  String? avatar;

  String gender;

  String? position;

  String? status;

  @JsonKey(name: "start_work_time")
  String startWorkTime;

  @JsonKey(name: "end_work_time")
  String endWorkTime;

  List<Service>? services;

  //
  // List<String> workedInSalons;
  //
  // Map<String, String>? providedServices;

  Master(
      {id,
      name,
      description,
      this.avatar,
      this.position,
      this.status,
      required this.firstname,
      required this.lastname,
      this.email,
      this.country,
      this.city,
      required this.locale,
      required this.gender,
      required this.startWorkTime,
      required this.endWorkTime,
      required this.phoneNumber,
      this.services})
      : super(id);

  factory Master.fromJson(Map<String, dynamic> json) {
    return _$MasterFromJson(json);
  }

  Map<String, dynamic> toJson() => _$MasterToJson(this);

  String get name {
    return "$firstname $lastname";
  }

  Master copy(
      {String? avatar,
      String? position,
      String? status,
      String? firstname,
      String? lastname,
      String? email,
      String? country,
      String? city,
      String? locale,
      String? gender,
      String? startWorkTime,
      String? endWorkTime,
      String? phoneNumber}) {
    return Master(
      id: id,
      avatar: avatar ?? this.avatar,
      position: position ?? this.position,
      status: status ?? this.status,
      firstname: firstname ?? this.firstname,
      lastname: lastname ?? this.lastname,
      email: email ?? this.email,
      country: country ?? this.country,
      city: city ?? this.city,
      locale: locale ?? this.locale,
      gender: gender ?? this.gender,
      startWorkTime: startWorkTime ?? this.startWorkTime,
      endWorkTime: endWorkTime ?? this.endWorkTime,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      services: this.services,
    );
  }

  @override
  int get hashCode => id.hashCode;

  @override
  bool operator ==(Object other) {
    return id == (other as Master).id;
  }
}
