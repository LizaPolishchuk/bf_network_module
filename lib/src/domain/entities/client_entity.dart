import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:salons_app_flutter_module/src/data/caches/local_starage.dart';

import 'base_entity.dart';

part 'client_entity.g.dart';

@HiveType(typeId: hiveTypeClients)
@JsonSerializable()
class Client extends BaseEntity {
  @HiveField(3)
  String? photoUrl;
  @HiveField(4)
  String? city;
  @HiveField(5)
  String? status;
  @HiveField(6)
  String? phone;
  @HiveField(7)
  Map<String, String>? services;
  @HiveField(8)
  String? creatorSalon;

  Client(id, name, description, this.photoUrl, this.city, this.status, this.phone, this.services, this.creatorSalon)
      : super(id, name, description);

  factory Client.fromJson(Map<String, dynamic> json) {
    json["id"] = (json["id"] as String?) ?? json["_id"] ?? "";
    return _$ClientFromJson(json);
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = _$ClientToJson(this);
    json["_id"] = json["id"];
    json.remove("id");
    return json;
  }

  Client copy(
      {String? name,
      String? photoUrl,
      String? city,
      String? status,
      String? phone,
      Map<String, String>? service,
      String? creatorSalon}) {
    return Client(id, name ?? this.name, description, photoUrl ?? this.photoUrl, city ?? this.city,
        status ?? this.status, phone ?? this.phone, services ?? this.services, creatorSalon ?? this.creatorSalon);
  }

  @override
  int get hashCode => id.hashCode;

  @override
  bool operator ==(Object other) {
    return id == (other as Client).id;
  }
}
