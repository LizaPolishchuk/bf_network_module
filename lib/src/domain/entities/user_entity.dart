class UserEntity {
  //public
  late String id;
  late String name;
  String? avatar;
  bool isAdmin = false;

  UserEntity(this.id, this.name, this.avatar);

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    if (id != null) {
      map['id'] = id;
    }
    map['name'] = name;
    map['avatar'] = avatar;
    return map;
  }

  UserEntity.fromMap(Map<String, dynamic> map) {
    this.id = map['id'];
    this.name = map['name'];
    this.avatar = map['avatar'];
    this.isAdmin = map['isAdmin'] ?? false;
  }
}
