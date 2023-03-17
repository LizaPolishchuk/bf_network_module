import 'package:json_annotation/json_annotation.dart';

part 'user_entity.g.dart';

@JsonSerializable()
class UserEntity {
  final String id;

  final String firstname;

  final String lastname;

  final String? email;

  @JsonKey(name: "phone_number")
  final String phone;

  final String? city;

  final String? country;

  final String locale;

  @JsonKey(name: "photo_url")
  final String? avatar;

  final String gender;

  //

  //
  // @JsonKey(defaultValue: false)
  // bool? isAdmin;
  //
  // bool? isActivated;
  //
  // @JsonKey(defaultValue: true)
  // bool? isRegistered;

  String get name {
    return "$firstname $lastname";
  }

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
