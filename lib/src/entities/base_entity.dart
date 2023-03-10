

class BaseEntity {
  
  late String id;

  BaseEntity(this.id);

  BaseEntity.fromMap(Map<String, dynamic> map) {
    id = map['id'] ?? "";
  }
}
