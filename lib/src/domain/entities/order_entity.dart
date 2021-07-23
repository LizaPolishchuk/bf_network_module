import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:salons_app_flutter_module/src/data/caches/local_starage.dart';

part 'order_entity.g.dart';

enum OrderForType { SALON, SERVICE, MASTER }

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
  bool isPinned = false;

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
      this.isPinned);

  factory OrderEntity.fromJson(Map<String, dynamic> json) {
    json['date'] = (json['date'] as Timestamp).toDate().toIso8601String();
    return _$OrderEntityFromJson(json);
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = _$OrderEntityToJson(this);
    // it is only local parametr
    json.remove(["isPinned"]);
    return json;
  }

  OrderEntity copy({
    String? clientName,
    String? masterId,
    String? masterName,
    String? masterAvatar,
    String? serviceId,
    String? serviceName,
    bool? isPinned,
  }) {
    return OrderEntity(
      id,
      clientId,
      clientName ?? this.clientName,
      salonId,
      salonName,
      masterId ?? this.masterId,
      masterName ?? this.masterName,
      masterAvatar ?? this.masterAvatar,
      serviceId ?? this.serviceId,
      serviceName ?? this.serviceName,
      date,
      price,
      isPinned ?? this.isPinned,
    );
  }
}
