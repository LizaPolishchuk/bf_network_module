
import 'package:json_annotation/json_annotation.dart';
import 'package:salons_app_flutter_module/src/entities/base_entity.dart';

part 'salon_entity.g.dart';

@JsonSerializable()
class Salon extends BaseEntity {
  String name;

  String description;

  @JsonKey(name: "photo_url")
  String? photo;
  
  String? email;
  
  String? city;
  
  String? country;
  
  String locale;
  
  String? address;
  
  @JsonKey(name: "phone_number")
  String phoneNumber;

  // 
  // bool? isTop;
  // 
  // bool isFavourite;
  //
  // @JsonKey(ignore: true)
  // List<Master> mastersList = [];
  // @JsonKey(ignore: true)
  // List<Service> servicesList = [];

  Salon({
    id,
    required this.name,
    required this.description,
    this.photo,
    this.email,
    this.city,
    this.country,
    this.address,
    required this.locale,
    required this.phoneNumber,
    // this.isTop,
    // this.isFavourite = false
  }) : super(id);

  factory Salon.fromJson(Map<String, dynamic> json) {
    return _$SalonFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SalonToJson(this);
}
