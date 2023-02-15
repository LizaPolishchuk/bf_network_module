import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:salons_app_flutter_module/salons_app_flutter_module.dart';

part 'salon_entity.g.dart';

@HiveType(typeId: hiveTypeSalons)
@JsonSerializable()
class Salon extends BaseEntity {
  @HiveField(3)
  @JsonKey(name: "photo_url")
  String? photo;
  @HiveField(4)
  String? email;
  @HiveField(5)
  String? city;
  @HiveField(6)
  String? country;
  @HiveField(7)
  String locale;
  @HiveField(8)
  String? address;
  @HiveField(9)
  @JsonKey(name: "phone_number")
  String phoneNumber;

  // @HiveField(8)
  // bool? isTop;
  // @HiveField(9)
  // bool isFavourite;
  //
  // @JsonKey(ignore: true)
  // List<Master> mastersList = [];
  // @JsonKey(ignore: true)
  // List<Service> servicesList = [];

  Salon({
    id,
    name,
    description,
    this.photo,
    this.email,
    this.city,
    this.country,
    this.address,
    required this.locale,
    required this.phoneNumber,
    // this.isTop,
    // this.isFavourite = false
  }) : super(id, name, description);

  factory Salon.fromJson(Map<String, dynamic> json) {
    return _$SalonFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SalonToJson(this);
}
