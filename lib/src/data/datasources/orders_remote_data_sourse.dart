import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:salons_app_flutter_module/salons_app_flutter_module.dart';
import 'package:salons_app_flutter_module/src/data/datasources/api_client.dart';
import 'package:salons_app_flutter_module/src/domain/entities/order_entity.dart';

const ORDERS_COLLECTION = 'orders';

abstract class OrdersRemoteDataSource {
  Future<List<OrderEntity>> getCurrentUserOrdersList();

  Future<List<OrderEntity>> getOrdersList(String id, OrderForType orderForType);
  Future<List<OrderEntity>> getAvailableTime(String salonId, String serviceId, String masterId, String date);

  Future<OrderEntity> addOrder(OrderEntity orderEntity);

  Future<OrderEntity> updateOrder(OrderEntity orderEntity);

  Future<void> removeOrder(String orderId);
}

class OrdersRemoteDataSourceImpl implements OrdersRemoteDataSource {
  late CollectionReference ordersCollection;
  final LocalStorage _localStorage;
  final APIClient _apiClient;

  OrdersRemoteDataSourceImpl(this._localStorage, this._apiClient) {
    ordersCollection =
        FirebaseFirestore.instance.collection(ORDERS_COLLECTION);
  }

  @override
  Future<List<OrderEntity>> getCurrentUserOrdersList() async {
    try {
      String currentUserId = await _localStorage.getUserId() ?? "";
      Query query = ordersCollection.where(
          "clientId", isEqualTo: currentUserId);
      QuerySnapshot snapshot = await query.get();

      return snapshot.docs.map((doc) =>
          OrderEntity.fromJson(doc.data() as Map<String, dynamic>)
      ).toList();
    } catch (e) {
      print("getCurrentUserOrdersList error: ${e.toString()}");
      throw(e);
    }
  }

  @override
  Future<List<OrderEntity>> getOrdersList(String id,
      OrderForType orderForType) async {
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
      case OrderForType.USER:
        queryField = "userId";
        break;
    }

    final response = await _apiClient.getOrdersList(id, {queryField: id});

    if (response.data == null) {
      throw(Failure(message: response.message ?? "getOrdersList error: orders is null"));
    }

    return response.data!;
  }

  @override
  Future<List<OrderEntity>> getAvailableTime(String salonId, String serviceId, String masterId, String date) async {
    final response = await _apiClient.getAvailableTimeList(salonId, masterId, serviceId, date);

    if (response.data == null) {
      throw(Failure(message: response.message ?? "getOrdersList error: orders is null"));
    }

    return response.data!;
  }


  @override
  Future<void> removeOrder(String orderId) async {
    final response = await _apiClient.deleteOrder(orderId);

    return;
  }

  @override
  Future<OrderEntity> updateOrder(OrderEntity orderEntity) async {
    final response = await _apiClient.updateOrder(orderEntity);

    if (response.data == null) {
      throw(Failure(message: response.message ?? "updateOrder error: order is null"));
    }

    return response.data!;
  }

  @override
  Future<OrderEntity> addOrder(OrderEntity orderEntity) async {
    final response = await _apiClient.addOrder(orderEntity);

    if (response.data == null) {
      throw(Failure(message: response.message ?? "addOrder error: order is null"));
    }

    return response.data!;
  }

}
