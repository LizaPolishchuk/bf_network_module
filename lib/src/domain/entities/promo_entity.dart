import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:salons_app_flutter_module/src/data/caches/local_starage.dart';

import 'base_entity.dart';

part 'promo_entity.g.dart';

// @HiveType(typeId: hiveTypePromos)
@JsonSerializable()
class Promo extends BaseEntity {
  // @HiveField(3)
  @JsonKey(name: "promo_type")
  final String promoType;

  // @HiveField(4)
  @JsonKey(name: "photo_url")
  final String? photoUrl;

  // @HiveField(7)
  @JsonKey(name: "day_expire")
  final DateTime? expiredDate;

  // @HiveField(8)
  @JsonKey(name: "salon_uuid")
  final String creatorSalon;

  Promo({id, name, description, required this.promoType, this.photoUrl, this.expiredDate, required this.creatorSalon})
      : super(id, name, description);

  factory Promo.fromJson(Map<String, dynamic> json) => _$PromoFromJson(json);

  Map<String, dynamic> toJson() => _$PromoToJson(this);

  Promo copy({
    String? name,
    String? description,
    String? promoType,
    String? photoUrl,
    DateTime? expiredDate,
    String? creatorSalon,
  }) {
    return Promo(
      id: id,
      name: name ?? this.name,
      description: description ?? this.description,
      photoUrl: photoUrl ?? this.photoUrl,
      expiredDate: expiredDate ?? this.expiredDate,
      creatorSalon: creatorSalon ?? this.creatorSalon,
      promoType: promoType ?? this.promoType,
    );
  }

  @override
  int get hashCode => id.hashCode;

  @override
  bool operator ==(Object other) {
    return id == (other as Promo).id;
  }
}
