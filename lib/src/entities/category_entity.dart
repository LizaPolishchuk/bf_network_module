import 'package:json_annotation/json_annotation.dart';

import 'base_entity.dart';

part 'category_entity.g.dart';

@JsonSerializable()
class Category extends BaseEntity {
  String name;
  String description;

  double? priceFrom;

  double? priceTo;

  String? creatorSalon;

  int? color;

  Category(
      {id, required this.name, required this.description, this.priceFrom, this.priceTo, this.creatorSalon, this.color})
      : super(id);

  factory Category.fromJson(Map<String, dynamic> json) {
    return _$CategoryFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$CategoryToJson(this);
    ;
  }

  Category copy(
      {String? name, String? description, double? priceFrom, double? priceTo, String? creatorSalon, int? color}) {
    return Category(
      id: this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      priceFrom: priceFrom ?? this.priceFrom,
      priceTo: priceTo ?? this.priceTo,
      creatorSalon: creatorSalon ?? this.creatorSalon,
      color: color ?? this.color,
    );
  }

  @override
  int get hashCode => id.hashCode;

  @override
  bool operator ==(Object other) {
    return id == (other as Category).id;
  }
}
