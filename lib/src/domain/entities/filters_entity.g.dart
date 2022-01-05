// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filters_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Filters _$FiltersEntityFromJson(Map<String, dynamic> json) {
  return Filters(
    json['id'] as String,
    (json['popularCategories'] as Map<String, dynamic>?)?.map(
      (k, e) => MapEntry(int.parse(k), e as String),
    ),
    (json['popularServices'] as Map<String, dynamic>?)?.map(
      (k, e) => MapEntry(int.parse(k), e as String),
    ),
  );
}

Map<String, dynamic> _$FiltersEntityToJson(Filters instance) =>
    <String, dynamic>{
      'id': instance.id,
      'popularCategories':
          instance.popularCategories?.map((k, e) => MapEntry(k.toString(), e)),
      'popularServices':
          instance.popularServices?.map((k, e) => MapEntry(k.toString(), e)),
    };
