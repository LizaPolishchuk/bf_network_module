import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:salons_app_flutter_module/src/data/caches/local_starage.dart';

import 'base_entity.dart';

part 'master_entity.g.dart';

@HiveType(typeId: hiveTypeMasters)
@JsonSerializable()
class Master extends BaseEntity {
  @HiveField(3)
  String? avatar;
  @HiveField(4)
  String? avatarPath;
  @HiveField(5)
  String? position;
  @HiveField(6)
  List<String> workedInSalons;
  @HiveField(7)
  Map<String, String>? providedServices;
  @HiveField(8)
  String? status;
  @HiveField(9)
  String? phoneNumber;

  Master(id, name, description, this.avatar, this.avatarPath, this.position, this.workedInSalons, this.providedServices,
      this.status, this.phoneNumber)
      : super(id, name, description);

  factory Master.fromJson(Map<String, dynamic> json) {
    json["id"] = (json["id"] as String?) ?? json["_id"] ?? "";
    return _$MasterFromJson(json);
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = _$MasterToJson(this);
    json["_id"] = json["id"];
    json.remove("id");
    return json;
  }

  Master copy({String? name, String? position, String? phoneNumber, String? status, Map<String, String>? providedServices}) {
    return Master(id, name ?? this.name, description, avatar, avatarPath, position ?? this.position, workedInSalons,
        providedServices ?? this.providedServices, status ?? this.status, phoneNumber ?? this.phoneNumber);
  }

  @override
  int get hashCode => id.hashCode;

  @override
  bool operator ==(Object other) {
    return id == (other as Master).id;
  }
}
