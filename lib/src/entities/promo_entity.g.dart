// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'promo_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Promo _$PromoFromJson(Map<String, dynamic> json) => Promo(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      promoType: json['promo_type'] as String,
      photoUrl: json['photo_url'] as String?,
      expiredDate: json['day_expire'] == null
          ? null
          : DateTime.parse(json['day_expire'] as String),
      creatorSalon: json['salon_uuid'] as String,
      color: json['color'] as int?,
      discount: json['discount'] as int?,
    );

Map<String, dynamic> _$PromoToJson(Promo instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'promo_type': instance.promoType,
      'photo_url': instance.photoUrl,
      'day_expire': instance.expiredDate?.toIso8601String(),
      'salon_uuid': instance.creatorSalon,
      'color': instance.color,
      'discount': instance.discount,
    };
