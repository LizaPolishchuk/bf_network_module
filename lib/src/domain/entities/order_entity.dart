import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:salons_app_flutter_module/src/data/caches/local_starage.dart';

part 'order_entity.g.dart';

enum OrderForType { USER, SALON, MASTER, SERVICE }

@HiveType(typeId: hiveTypeOrders)
@JsonSerializable()
class OrderEntity {
  @HiveField(0)
  String id;
  @HiveField(1)
  String? clientId;
  @HiveField(2)
  String? clientName;
  @HiveField(3)
  String salonId;
  @HiveField(4)
  String salonName;
  @HiveField(5)
  String masterId;
  @HiveField(6)
  String masterName;
  @HiveField(7)
  String? masterAvatar;
  @HiveField(8)
  String serviceId;
  @HiveField(9)
  String serviceName;
  @HiveField(10)
  DateTime date;
  @HiveField(11)
  double price;
  @HiveField(12)
  @JsonKey(ignore: true)
  bool isPinned;

  OrderEntity(
      this.id,
      this.clientId,
      this.clientName,
      this.salonId,
      this.salonName,
      this.masterId,
      this.masterName,
      this.masterAvatar,
      this.serviceId,
      this.serviceName,
      this.date,
      this.price,
      {this.isPinned = false});

  factory OrderEntity.fromJson(Map<String, dynamic> json) {
    json["id"] = (json["id"] as String?) ?? json["_id"] ?? "";
    return _$OrderEntityFromJson(json);
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = _$OrderEntityToJson(this);
    json["_id"] = json["id"];
    json.remove("id");
    return json;
  }

  OrderEntity copy({
    String? clientName,
    String? clientId,
    String? masterId,
    String? masterName,
    String? masterAvatar,
    String? serviceId,
    String? serviceName,
    bool? isPinned,
    double? price,
  }) {
    return OrderEntity(
      id,
      clientId ?? this.clientId,
      clientName ?? this.clientName,
      salonId,
      salonName,
      masterId ?? this.masterId,
      masterName ?? this.masterName,
      masterAvatar ?? this.masterAvatar,
      serviceId ?? this.serviceId,
      serviceName ?? this.serviceName,
      date,
      price ?? this.price,
      isPinned: isPinned ?? this.isPinned,
    );
  }

  @override
  int get hashCode {
    return id.hashCode;
  }

  @override
  bool operator ==(Object other) {
    return (other as OrderEntity).id == this.id;
  }
}
