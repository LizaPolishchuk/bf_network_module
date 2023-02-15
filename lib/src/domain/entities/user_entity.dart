import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:salons_app_flutter_module/salons_app_flutter_module.dart';

part 'user_entity.g.dart';

@HiveType(typeId: hiveTypeUsers)
@JsonSerializable()
class UserEntity {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String firstname;
  @HiveField(2)
  final String lastname;
  @HiveField(3)
  final String? email;
  @HiveField(4)
  @JsonKey(name: "phone_number")
  final String phone;
  @HiveField(5)
  final String? city;
  @HiveField(6)
  final String? country;
  @HiveField(7)
  final String locale;
  @HiveField(8)
  @JsonKey(name: "photo_url")
  final String? avatar;
  @HiveField(9)
  final String gender; //

  // @HiveField(6)
  // @JsonKey(defaultValue: false)
  // bool? isAdmin;
  // @HiveField(7)
  // bool? isActivated;
  // @HiveField(8)
  // @JsonKey(defaultValue: true)
  // bool? isRegistered;

  UserEntity({
    required this.id,
    required this.firstname,
    required this.lastname,
    required this.phone,
    this.email,
    this.avatar,
    this.city,
    this.country,
    required this.locale,
    required this.gender,
  });

  factory UserEntity.fromJson(Map<String, dynamic> json) {
    return _$UserEntityFromJson(json);
  }

  Map<String, dynamic> toJson() => _$UserEntityToJson(this);

  UserEntity copy(
      {String? firstname,
      String? lastname,
      String? phone,
      String? email,
      String? avatar,
      String? city,
      String? country,
      String? locale,
      String? gender}) {
    return UserEntity(
      id: id,
      firstname: firstname ?? this.firstname,
      lastname: lastname ?? this.lastname,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      avatar: avatar ?? this.avatar,
      city: city ?? this.city,
      country: country ?? this.country,
      locale: locale ?? this.locale,
      gender: gender ?? this.gender,
    );
  }
}
