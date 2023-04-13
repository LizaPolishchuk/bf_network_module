// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Category _$CategoryFromJson(Map<String, dynamic> json) => Category(
      id: json['uuid'],
      name: json['name'] as String,
      description: json['description'] as String,
      priceFrom: (json['priceFrom'] as num?)?.toDouble(),
      priceTo: (json['priceTo'] as num?)?.toDouble(),
      creatorSalon: json['creatorSalon'] as String?,
      color: json['color'] as int?,
    );

Map<String, dynamic> _$CategoryToJson(Category instance) => <String, dynamic>{
      'uuid': instance.id,
      'name': instance.name,
      'description': instance.description,
      'priceFrom': instance.priceFrom,
      'priceTo': instance.priceTo,
      'creatorSalon': instance.creatorSalon,
      'color': instance.color,
    };
