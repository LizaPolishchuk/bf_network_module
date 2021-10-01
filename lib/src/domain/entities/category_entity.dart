import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:salons_app_flutter_module/src/data/caches/local_starage.dart';

import 'base_entity.dart';

part 'category_entity.g.dart';

@HiveType(typeId: hiveTypeCategories)
@JsonSerializable()
class Category extends BaseEntity {
  @HiveField(3)
  double? priceFrom;
  @HiveField(4)
  double? priceTo;
  @HiveField(5)
  String? creatorSalon;

  Category(id, name,description, this.priceFrom, this.priceTo, this.creatorSalon) : super(id, name,description);

  factory Category.fromJson(Map<String, dynamic> json) {
    json["id"] = (json["id"] as String?) ?? json["_id"] ?? "";
    return _$CategoryFromJson(json);
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = _$CategoryToJson(this);
    json["_id"] = json["id"];
    json.remove("id");
    return json;
  }

  Category copy({String? id, String? name, double? priceFrom, double? priceTo, String? creatorSalon}) {
    return Category(id ?? this.id, name ?? this.name, description, priceFrom ?? this.priceFrom, priceTo ?? this.priceTo, creatorSalon ?? this.creatorSalon);
  }

  @override
  int get hashCode => id.hashCode;

  @override
  bool operator ==(Object other) {
    return id == (other as Category).id;
  }
}
