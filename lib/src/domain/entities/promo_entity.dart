import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:salons_app_flutter_module/src/data/caches/local_starage.dart';

import 'base_entity.dart';

part 'promo_entity.g.dart';

@HiveType(typeId: hiveTypePromos)
@JsonSerializable()
class Promo extends BaseEntity {
  @HiveField(3)
  String? photoUrl;
  @HiveField(4)
  DateTime? expiredDate;
  @HiveField(5)
  String? creatorSalon;

  Promo(id, name, description, this.photoUrl, this.expiredDate, this.creatorSalon) : super(id, name, description);

  factory Promo.fromJson(Map<String, dynamic> json) {
    json["id"] = (json["id"] as String?) ?? json["_id"] ?? "";
    return _$PromoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = _$PromoToJson(this);
    json["_id"] = json["id"];
    json.remove("id");
    return json;
  }

  Promo copy({String? name, String? description, String? photoUrl, DateTime? expiredDate, String? creatorSalon}) {
    return Promo(id, name ?? this.name, description ?? this.description, photoUrl ?? this.photoUrl,
        expiredDate ?? this.expiredDate, creatorSalon ?? this.creatorSalon);
  }

  @override
  int get hashCode => id.hashCode;

  @override
  bool operator ==(Object other) {
    return id == (other as Promo).id;
  }
}
