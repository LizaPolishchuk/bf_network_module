import 'package:salons_app_flutter_module/salons_app_flutter_module.dart';
import 'package:salons_app_flutter_module/src/common/utils/connectivity_manager.dart';
import 'package:salons_app_flutter_module/src/data/datasources/api_client.dart';
import 'package:salons_app_flutter_module/src/domain/entities/order_entity.dart';

abstract class OrdersRemoteDataSource {
  Future<List<OrderEntity>> getOrdersList(String id, OrderForType orderForType,
      String? dateFor, String? dateFrom, String? dateTo);

  Future<List<OrderEntity>> getAvailableTime(String salonId, String serviceId,
      String masterId, String date);

  Future<OrderEntity> addOrder(OrderEntity orderEntity);

  Future<OrderEntity> updateOrder(OrderEntity orderEntity);

  Future<void> removeOrder(String orderId);
}

class OrdersRemoteDataSourceImpl implements OrdersRemoteDataSource {
  final LocalStorage _localStorage;
  final APIClient _apiClient;

  OrdersRemoteDataSourceImpl(this._localStorage, this._apiClient);

  @override
  Future<List<OrderEntity>> getOrdersList(String id,
      OrderForType orderForType, String? dateFor, String? dateFrom,
      String? dateTo) async {
    await ConnectivityManager.checkInternetConnection();

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

    final response = await _apiClient.getOrdersList({
      queryField: id,
      "dateFor": dateFor,
      "dateFrom": dateFrom,
      "dateTo": dateTo
    });

    if (response.data == null) {
      throw(Failure(
          message: response.message ?? "getOrdersList error: orders is null"));
    }

    return response.data!;
  }

  @override
  Future<List<OrderEntity>> getAvailableTime(String salonId, String serviceId,
      String masterId, String date) async {
    await ConnectivityManager.checkInternetConnection();

    final response = await _apiClient.getAvailableTimeList(
        salonId, masterId, serviceId, date);

    if (response.data == null) {
      throw(Failure(
          message: response.message ?? "getOrdersList error: orders is null"));
    }

    return response.data!;
  }


  @override
  Future<void> removeOrder(String orderId) async {
    await ConnectivityManager.checkInternetConnection();

    final response = await _apiClient.deleteOrder(orderId);

    return;
  }

  @override
  Future<OrderEntity> updateOrder(OrderEntity orderEntity) async {
    await ConnectivityManager.checkInternetConnection();

    final response = await _apiClient.updateOrder(orderEntity);

    if (response.data == null) {
      throw(Failure(
          message: response.message ?? "updateOrder error: order is null"));
    }

    return response.data!;
  }

  @override
  Future<OrderEntity> addOrder(OrderEntity orderEntity) async {
    await ConnectivityManager.checkInternetConnection();

    final response = await _apiClient.addOrder(orderEntity);

    if (response.data == null) {
      throw(Failure(
          message: response.message ?? "addOrder error: order is null"));
    }

    return response.data!;
  }

}
