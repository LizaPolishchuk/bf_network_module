import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:salons_app_flutter_module/src/data/caches/local_starage.dart';

import 'base_entity.dart';

part 'master_entity.g.dart';


@HiveType(typeId: hiveTypeMasters)
@JsonSerializable()
class Master extends BaseEntity{
  @HiveField(2)
  String? avatar;
  @HiveField(3)
  String? avatarPath;
  @HiveField(4)
  String? position;
  @HiveField(5)
  List<String> workedInSalons;
  @HiveField(6)
  Map<String, String>? providedServices;
  @HiveField(7)
  String? status;

  Master(id, name, this.avatar, this.avatarPath, this.position, this.workedInSalons, this.providedServices, this.status) : super(id, name);

  factory Master.fromJson(Map<String, dynamic> json) {
    return _$MasterFromJson(json);
  }

  Map<String, dynamic> toJson() => _$MasterToJson(this);


  Master copy({String? name, String? position}) {
    return Master(id, name ?? this.name, avatar, avatarPath, position ?? this.position, workedInSalons, providedServices, status);
  }

  @override
  int get hashCode => id.hashCode;

  @override
  bool operator ==(Object other) {
    return id == (other as Master).id;
  }
}
