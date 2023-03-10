import 'package:json_annotation/json_annotation.dart';

import 'base_entity.dart';

part 'client_entity.g.dart';

@JsonSerializable()
class Client extends BaseEntity {
  String name;

  String? photoUrl;

  String? city;

  String? status;

  String? phone;

  Map<String, String>? services;

  String? creatorSalon;

  Client(id, this.name, this.photoUrl, this.city, this.status, this.phone, this.services, this.creatorSalon)
      : super(id);

  factory Client.fromJson(Map<String, dynamic> json) {
    return _$ClientFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ClientToJson(this);
  }

  Client copy(
      {String? name,
      String? photoUrl,
      String? city,
      String? status,
      String? phone,
      Map<String, String>? service,
      String? creatorSalon}) {
    return Client(id, name ?? this.name, photoUrl ?? this.photoUrl, city ?? this.city,
        status ?? this.status, phone ?? this.phone, services ?? this.services, creatorSalon ?? this.creatorSalon);
  }

  @override
  int get hashCode => id.hashCode;

  @override
  bool operator ==(Object other) {
    return id == (other as Client).id;
  }
}
