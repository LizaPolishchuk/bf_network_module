// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Category _$CategoryFromJson(Map<String, dynamic> json) => Category(
      json['id'],
      json['name'],
      json['description'],
      (json['priceFrom'] as num?)?.toDouble(),
      (json['priceTo'] as num?)?.toDouble(),
      json['creatorSalon'] as String?,
      json['color'] as int?,
    );

Map<String, dynamic> _$CategoryToJson(Category instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'priceFrom': instance.priceFrom,
      'priceTo': instance.priceTo,
      'creatorSalon': instance.creatorSalon,
      'color': instance.color,
    };
