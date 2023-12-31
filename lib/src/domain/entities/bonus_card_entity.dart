import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:bf_network_module/src/data/caches/local_starage.dart';

import 'base_entity.dart';

part 'bonus_card_entity.g.dart';

@HiveType(typeId: hiveTypeBonusCards)
@JsonSerializable()
class BonusCard extends BaseEntity {
  @HiveField(3)
  int? color;
  @HiveField(4)
  int? discount;
  @HiveField(5)
  String? creatorSalon;

  BonusCard(id, name, description, this.color, this.discount, this.creatorSalon) : super(id, name, description);

  factory BonusCard.fromJson(Map<String, dynamic> json) {
    json["id"] = (json["id"] as String?) ?? json["_id"] ?? "";
    return _$BonusCardFromJson(json);
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = _$BonusCardToJson(this);
    json["_id"] = json["id"];
    json.remove("id");
    return json;
  }

  BonusCard copy({String? name, String? description, int? color, int? discount, String? creatorSalon}) {
    return BonusCard(id, name ?? this.name, description ?? this.description, color ?? this.color,
        discount ?? this.discount, creatorSalon ?? this.creatorSalon);
  }

  @override
  int get hashCode => id.hashCode;

  @override
  bool operator ==(Object other) {
    return id == (other as BonusCard).id;
  }
}
