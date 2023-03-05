

class BaseEntity {
  
  late String id;
  
  late String name;
  
  late String? description;

  BaseEntity(this.id, this.name, this.description);

  BaseEntity.fromMap(Map<String, dynamic> map) {
    id = map['id'] ?? "";
    name = map['name'];
    description = map['description'];
  }
}
