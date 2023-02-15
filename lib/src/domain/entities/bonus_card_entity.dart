import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:salons_app_flutter_module/src/data/caches/local_starage.dart';

import 'base_entity.dart';

part 'bonus_card_entity.g.dart';

@HiveType(typeId: hiveTypeBonusCards)
@JsonSerializable()
class BonusCard extends BaseEntity {
  @HiveField(3)
  final int? color;
  @HiveField(4)
  final int? discount;
  @HiveField(5)
  @JsonKey(name: "salon_uuid")
  final String? creatorSalon;
  @HiveField(6)
  @JsonKey(name: "promo_type")
  final String promoType;
  @HiveField(7)
  @JsonKey(name: "day_expire")
  final String? expiredDate;

  BonusCard(
      {id,
      name,
      description,
      required this.promoType,
      required this.discount,
      this.color,
      this.expiredDate,
      required this.creatorSalon})
      : super(id, name, description);

  factory BonusCard.fromJson(Map<String, dynamic> json) => _$BonusCardFromJson(json);

  Map<String, dynamic> toJson() => _$BonusCardToJson(this);

  BonusCard copy(
      {String? name,
      String? description,
      String? promoType,
      int? color,
      int? discount,
      String? creatorSalon,
      String? expiredDate}) {
    return BonusCard(
      id: id,
      name: name ?? this.name,
      description: description ?? this.description,
      color: color ?? this.color,
      discount: discount ?? this.discount,
      creatorSalon: creatorSalon ?? this.creatorSalon,
      expiredDate: expiredDate ?? this.expiredDate,
      promoType: promoType ?? this.promoType,
    );
  }

  @override
  int get hashCode => id.hashCode;

  @override
  bool operator ==(Object other) {
    return id == (other as BonusCard).id;
  }
}
