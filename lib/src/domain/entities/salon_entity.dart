import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:bf_network_module/bf_network_module.dart';
import 'package:bf_network_module/src/data/caches/local_starage.dart';

import 'base_entity.dart';
import 'master_entity.dart';

part 'salon_entity.g.dart';

@HiveType(typeId: hiveTypeSalons)
@JsonSerializable()
class Salon extends BaseEntity {
  @HiveField(3)
  String? photo;
  @HiveField(4)
  String? photoPath;
  @HiveField(5)
  String? ownerId;
  @HiveField(6)
  String? address;
  @HiveField(7)
  String? phoneNumber;
  @HiveField(8)
  bool? isTop;
  @HiveField(9)
  bool isFavourite;

  @JsonKey(ignore: true)
  List<Master> mastersList = [];
  @JsonKey(ignore: true)
  List<Service> servicesList = [];

  Salon(
      [id,
      name,
      description,
      this.photo,
      this.photoPath,
      this.ownerId,
      this.address,
      this.phoneNumber,
      this.isTop,
      this.isFavourite = false])
      : super(id, name, description);

  factory Salon.fromJson(Map<String, dynamic> json) {
    json["id"] = (json["id"] as String?) ?? json["_id"] ?? "";
    return _$SalonFromJson(json);
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = _$SalonToJson(this);
    json["_id"] = json["id"];
    json.remove("id");
    return json;
  }
}
