import 'package:hive/hive.dart';


class BaseEntity {
  @HiveField(0)
  late String id;
  @HiveField(1)
  late String name;

  BaseEntity(this.id, this.name);

  BaseEntity.fromMap(Map<String, dynamic> map) {
    this.id = map['id'] ?? "";
    this.name = map['name'];
  }
}