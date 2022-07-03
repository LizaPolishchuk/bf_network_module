import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:salons_app_flutter_module/src/data/caches/local_starage.dart';

import 'base_entity.dart';

part 'service_entity.g.dart';

@HiveType(typeId: hiveTypeServices)
@JsonSerializable()
class Service extends BaseEntity {
  @HiveField(3)
  double? price;
  @HiveField(4)
  String? creatorSalon;
  @HiveField(5)
  String? categoryId;
  @HiveField(6)
  String? categoryName;
  @HiveField(7)
  int? categoryColor;
  @HiveField(8)
  int? duration;

  Service(id, name, description, this.price, this.creatorSalon, this.categoryId, this.categoryName, this.categoryColor,
      this.duration)
      : super(id, name, description);

  factory Service.fromJson(Map<String, dynamic> json) {
    json["id"] = (json["id"] as String?) ?? json["_id"] ?? "";
    return _$ServiceFromJson(json);
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = _$ServiceToJson(this);
    json["_id"] = json["id"];
    json.remove("id");
    return json;
  }

  Service copy(
      {String? id,
      String? name,
      double? price,
      String? creatorSalon,
      String? categoryId,
      String? categoryName,
      int? categoryColor,
      int? duration}) {
    return Service(id ?? this.id, name ?? this.name, description, price ?? this.price,
        creatorSalon ?? this.creatorSalon, categoryId ?? this.categoryId, categoryName ?? this.categoryName, categoryColor ?? this.categoryColor, duration ?? this.duration);
  }

  @override
  int get hashCode => id.hashCode;

  @override
  bool operator ==(Object other) {
    return id == (other as Service).id;
  }
}
