import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:salons_app_flutter_module/salons_app_flutter_module.dart';
import 'package:salons_app_flutter_module/src/domain/entities/order_entity.dart';

import '../../injection_container.dart';

const ORDERS_COLLECTION = 'orders';

abstract class OrdersRemoteDataSource {
  Future<List<OrderEntity>> getCurrentUserOrdersList();

  Future<List<OrderEntity>> getOrdersList(String id, OrderForType orderForType);

  Future<void> updateOrder(OrderEntity orderEntity);
  Future<void> removeOrder(OrderEntity orderEntity);
}

class OrdersRemoteDataSourceImpl implements OrdersRemoteDataSource {
  late CollectionReference ordersCollection;
  late LocalStorage localStorage;

  OrdersRemoteDataSourceImpl() {
    localStorage = getIt<LocalStorage>();
    ordersCollection =
        FirebaseFirestore.instance.collection(ORDERS_COLLECTION);
  }

  @override
  Future<List<OrderEntity>> getCurrentUserOrdersList() async {
    String currentUserId = await localStorage.getUserId() ?? "";
    Query query = ordersCollection.where("clientId", isEqualTo: currentUserId);
    QuerySnapshot snapshot = await query.get();

    return snapshot.docs.map((doc) =>
        OrderEntity.fromJson(doc.data() as Map<String, dynamic>)
    ).toList();
  }

  @override
  Future<List<OrderEntity>> getOrdersList(String id, OrderForType orderForType) async {
    String queryField = "";

    switch (orderForType) {
      case OrderForType.SALON:
        queryField = "salonId";
        break;
      case OrderForType.SERVICE:
        queryField = "serviceId";
        break;
      case OrderForType.MASTER:
        queryField = "masterId";
        break;
    }

    Query query = ordersCollection.where(queryField, isEqualTo: id);
    QuerySnapshot snapshot = await query.get();

    return snapshot.docs.map((doc) => OrderEntity.fromJson(doc.data() as Map<String, dynamic>)).toList();
  }

  @override
  Future<void> removeOrder(OrderEntity orderEntity) async {
    ordersCollection.doc(orderEntity.id).delete().catchError((Object error) {
      print(error);
    });

    return;
  }

  @override
  Future<void> updateOrder(OrderEntity orderEntity) async {
    final Map<String, dynamic> data = orderEntity.toJson();

    ordersCollection.doc(orderEntity.id).set(data).catchError((Object error) {
      print(error);
      return;
    });

    return;
  }
}
