import 'package:json_annotation/json_annotation.dart';

class BaseEntity {
  @JsonKey(name: "uuid")
  late String id;

  BaseEntity(this.id);

  BaseEntity.fromMap(Map<String, dynamic> map) {
    id = map['uuid'] ?? "";
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'uuid': id,
      };
}
