import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:salons_app_flutter_module/salons_app_flutter_module.dart';

part 'user_entity.g.dart';

@HiveType(typeId: hiveTypeUsers)
@JsonSerializable()
class UserEntity {
  @HiveField(0)
  String id;
  @HiveField(1)
  String? name;
  @HiveField(2)
  String? email;
  @HiveField(3)
  String? avatar;
  @HiveField(4)
  String? phone;
  @HiveField(5)
  bool isAdmin = false;
  @HiveField(6)
  bool? isActivated;

  UserEntity(this.id, this.name, this.email, this.avatar, this.phone,
      {this.isActivated});

  factory UserEntity.fromJson(Map<String, dynamic> json) {
    json["id"] = (json["id"] as String?) ?? json["_id"] ?? "";
    return _$UserEntityFromJson(json);
  }

  Map<String, dynamic> toJson() => _$UserEntityToJson(this);

  UserEntity copy({String? name, String? email, String? avatar, String? phone}) {
    return UserEntity(id, name ?? this.name, email ?? this.email,
        avatar ?? this.avatar, phone ?? this.phone);
  }
}
