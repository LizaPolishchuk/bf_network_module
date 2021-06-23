import 'package:hive/hive.dart';
import 'package:salons_app_flutter_module/src/data/caches/local_starage.dart';

import 'base_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'service_entity.g.dart';

@HiveType(typeId: hiveTypeServices)
@JsonSerializable()
class Service extends BaseEntity {
  @HiveField(2)
  double? price;

  Service(id,  name, this.price) : super(id, name);

  factory Service.fromJson(Map<String, dynamic> json) {
    return _$ServiceFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ServiceToJson(this);


  Service copy({String? id, String? name, double? price}) {
    return Service(id ?? this.id, name ?? this.name, price ?? this.price);
  }

  @override
  int get hashCode => id.hashCode;

  @override
  bool operator ==(Object other) {
    return id == (other as Service).id;
  }
}
