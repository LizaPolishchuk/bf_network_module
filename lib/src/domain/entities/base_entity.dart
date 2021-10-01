import 'package:hive/hive.dart';


class BaseEntity {
  @HiveField(0)
  late String id;
  @HiveField(1)
  late String name;
  @HiveField(2)
  late String? description;

  BaseEntity(this.id, this.name, this.description);

  BaseEntity.fromMap(Map<String, dynamic> map) {
    this.id = map['id'] ?? "";
    this.name = map['name'];
    this.description = map['description'];
  }
}