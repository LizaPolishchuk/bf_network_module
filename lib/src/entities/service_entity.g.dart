// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Service _$ServiceFromJson(Map<String, dynamic> json) => Service(
      id: json['uuid'],
      name: json['name'] as String,
      price: (json['price'] as num).toDouble(),
      categoryName: json['category'] as String?,
      categoryColor: json['category_color'] as int?,
      duration: json['duration'] as int,
    );

Map<String, dynamic> _$ServiceToJson(Service instance) => <String, dynamic>{
      'uuid': instance.id,
      'name': instance.name,
      'price': instance.price,
      'category': instance.categoryName,
      'category_color': instance.categoryColor,
      'duration': instance.duration,
    };
