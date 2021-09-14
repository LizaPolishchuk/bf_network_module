import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:salons_app_flutter_module/src/data/caches/local_starage.dart';

import 'base_entity.dart';

part 'salon_entity.g.dart';

@HiveType(typeId: hiveTypeSalons)
@JsonSerializable()
class Salon extends BaseEntity {
  @HiveField(2)
  String? photo;
  @HiveField(3)
  String? photoPath;
  @HiveField(4)
  String? ownerId;
  @HiveField(5)
  String? description;

  Salon([id, name, this.photo, this.photoPath, this.ownerId, this.description])
      : super(id, name);

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

  Salon.defaultSalon() : super("example_salon_id", "") {
    Salon("example_salon_id");
  }
}
