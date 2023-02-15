import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:salons_app_flutter_module/src/data/caches/local_starage.dart';

import 'base_entity.dart';

part 'master_entity.g.dart';

@HiveType(typeId: hiveTypeMasters)
@JsonSerializable()
class Master extends BaseEntity {
  @HiveField(3)
  String firstname;
  @HiveField(4)
  String lastname;
  @HiveField(5)
  @JsonKey(name: "phone_number")
  String phoneNumber;
  @HiveField(6)
  String? email;
  @HiveField(7)
  String? city;
  @HiveField(8)
  String? country;
  @HiveField(9)
  String locale;
  @HiveField(10)
  @JsonKey(name: "photo_url")
  String? avatar;
  @HiveField(11)
  String gender;
  @HiveField(12)
  String? position;
  @HiveField(13)
  String? status;
  @HiveField(14)
  @JsonKey(name: "start_work_time")
  String startWorkTime;
  @HiveField(15)
  @JsonKey(name: "end_work_time")
  String endWorkTime;

  // @HiveField(6)
  // List<String> workedInSalons;
  // @HiveField(7)
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
      required this.phoneNumber})
      : super(id, name, description);

  factory Master.fromJson(Map<String, dynamic> json) {
    return _$MasterFromJson(json);
  }

  Map<String, dynamic> toJson() => _$MasterToJson(this);

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
      name: name,
      description: description,
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
    );
  }

  @override
  int get hashCode => id.hashCode;

  @override
  bool operator ==(Object other) {
    return id == (other as Master).id;
  }
}
