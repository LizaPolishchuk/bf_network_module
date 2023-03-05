
import 'package:json_annotation/json_annotation.dart';


import 'base_entity.dart';

part 'category_entity.g.dart';

@JsonSerializable()
class Category extends BaseEntity {
  
  double? priceFrom;
  
  double? priceTo;
  
  String? creatorSalon;
  
  int? color;

  Category(id, name, description, this.priceFrom, this.priceTo, this.creatorSalon, this.color)
      : super(id, name, description);

  factory Category.fromJson(Map<String, dynamic> json) {
    return _$CategoryFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$CategoryToJson(this);;
  }

  Category copy({String? id, String? name, double? priceFrom, double? priceTo, String? creatorSalon, int? color}) {
    return Category(id ?? this.id, name ?? this.name, description, priceFrom ?? this.priceFrom, priceTo ?? this.priceTo,
        creatorSalon ?? this.creatorSalon, color ?? this.color);
  }

  @override
  int get hashCode => id.hashCode;

  @override
  bool operator ==(Object other) {
    return id == (other as Category).id;
  }
}
