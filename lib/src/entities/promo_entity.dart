import 'package:json_annotation/json_annotation.dart';

import 'base_entity.dart';

part 'promo_entity.g.dart';

enum PromoType {bonus_card, temporary_promo}

@JsonSerializable()
class Promo extends BaseEntity {
  String name;

  String description;

  @JsonKey(name: "promo_type")
  final String promoType;

  //
  @JsonKey(name: "photo_url")
  final String? photoUrl;

  //
  @JsonKey(name: "day_expire")
  final DateTime? expiredDate;

  //
  @JsonKey(name: "salon_uuid")
  final String creatorSalon;

  final int? color;

  final int? discount;

  Promo({
    id,
    required this.name,
    required this.description,
    required this.promoType,
    this.photoUrl,
    this.expiredDate,
    required this.creatorSalon,
    this.color,
    this.discount,
  }) : super(id);

  factory Promo.fromJson(Map<String, dynamic> json) => _$PromoFromJson(json);

  Map<String, dynamic> toJson() => _$PromoToJson(this);

  Promo copy({
    String? name,
    String? description,
    String? promoType,
    String? photoUrl,
    int? discount,
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
      discount: discount ?? this.discount,
    );
  }

  @override
  int get hashCode => id.hashCode;

  @override
  bool operator ==(Object other) {
    return id == (other as Promo).id;
  }
}
