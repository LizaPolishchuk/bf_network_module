// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filters_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Filters _$FiltersFromJson(Map<String, dynamic> json) => Filters(
      json['id'] as String,
      (json['popularServices'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(int.parse(k), e as String),
      ),
    );

Map<String, dynamic> _$FiltersToJson(Filters instance) => <String, dynamic>{
      'id': instance.id,
      'popularServices':
          instance.popularServices?.map((k, e) => MapEntry(k.toString(), e)),
    };
