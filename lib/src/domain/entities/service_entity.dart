import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:salons_app_flutter_module/src/data/caches/local_starage.dart';

import 'base_entity.dart';

part 'service_entity.g.dart';

@HiveType(typeId: hiveTypeServices)
@JsonSerializable()
class Service extends BaseEntity {
  @HiveField(3)
  double price;
  @HiveField(4)
  @JsonKey(name: "category")
  String? categoryName;
  @HiveField(5)
  @JsonKey(name: "category_color")
  int? categoryColor;
  @HiveField(6)
  int duration;

  // @HiveField(4)
  // String? creatorSalon;
  // @HiveField(5)
  // String? categoryId;

  Service({id, name, description, required this.price, this.categoryName, this.categoryColor, required this.duration})
      : super(id, name, description);

  factory Service.fromJson(Map<String, dynamic> json) {
    return _$ServiceFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ServiceToJson(this);

  Service copy({String? id, String? name, double? price, String? categoryName, int? categoryColor, int? duration}) {
    return Service(
        id: id ?? this.id,
        name: name ?? this.name,
        description: description,
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
