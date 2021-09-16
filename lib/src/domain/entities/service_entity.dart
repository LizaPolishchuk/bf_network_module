import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:salons_app_flutter_module/src/data/caches/local_starage.dart';

import 'base_entity.dart';

part 'service_entity.g.dart';

@HiveType(typeId: hiveTypeServices)
@JsonSerializable()
class Service extends BaseEntity {
  @HiveField(2)
  double? price;
  @HiveField(3)
  String? creatorSalon;

  Service(id, name, this.price, this.creatorSalon) : super(id, name);

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

  Service copy({String? id, String? name, double? price, String? creatorSalon}) {
    return Service(id ?? this.id, name ?? this.name, price ?? this.price, creatorSalon ?? this.creatorSalon);
  }

  @override
  int get hashCode => id.hashCode;

  @override
  bool operator ==(Object other) {
    return id == (other as Service).id;
  }
}
