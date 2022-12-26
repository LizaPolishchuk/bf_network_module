// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_filters.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchFilters _$SearchFiltersFromJson(Map<String, dynamic> json) => SearchFilters(
      services: (json['services'] as List<dynamic>?)?.map((e) => e as int).toList(),
      priceFrom: json['priceFrom'] as int?,
      priceTo: json['priceTo'] as int?,
    );

Map<String, dynamic> _$SearchFiltersToJson(SearchFilters instance) => <String, dynamic>{
      'services': instance.services,
      'priceFrom': instance.priceFrom,
      'priceTo': instance.priceTo,
    };
