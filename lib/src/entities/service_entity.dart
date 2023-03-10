
import 'package:json_annotation/json_annotation.dart';


import 'base_entity.dart';

part 'service_entity.g.dart';

@JsonSerializable()
class Service extends BaseEntity {
  String name;

  double price;
  
  @JsonKey(name: "category")
  String? categoryName;
  
  @JsonKey(name: "category_color")
  int? categoryColor;
  
  int duration;

  // 
  // String? creatorSalon;
  // 
  // String? categoryId;

  Service({id, required this.name, required this.price, this.categoryName, this.categoryColor, required this.duration})
      : super(id);

  factory Service.fromJson(Map<String, dynamic> json) {
    return _$ServiceFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ServiceToJson(this);

  Service copy({String? id, String? name, double? price, String? categoryName, int? categoryColor, int? duration}) {
    return Service(
        id: id ?? this.id,
        name: name ?? this.name,
        price: price ?? this.price,
        categoryName: categoryName ?? this.categoryName,
        categoryColor: categoryColor ?? this.categoryColor,
        duration: duration ?? this.duration);
  }

  @override
  int get hashCode => id.hashCode;

  @override
  bool operator ==(Object other) {
    return id == (other as Service).id;
  }
}
