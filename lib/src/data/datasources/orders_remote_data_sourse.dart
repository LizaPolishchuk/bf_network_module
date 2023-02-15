import 'package:salons_app_flutter_module/salons_app_flutter_module.dart';
import 'package:salons_app_flutter_module/src/common/utils/connectivity_manager.dart';
import 'package:salons_app_flutter_module/src/data/datasources/api_client.dart';
import 'package:salons_app_flutter_module/src/domain/entities/appointment_entity.dart';

abstract class OrdersRemoteDataSource {
  Future<List<AppointmentEntity>> getOrdersList(
      String id, AppointmentForType orderForType, String? dateFor, String? dateFrom, String? dateTo);

  Future<List<AppointmentEntity>> getAvailableTime(String salonId, String serviceId, String masterId, String date);

  Future<AppointmentEntity> addOrder(AppointmentEntity orderEntity);

  Future<AppointmentEntity> updateOrder(AppointmentEntity orderEntity);

  Future<void> removeOrder(String orderId);
}

class OrdersRemoteDataSourceImpl implements OrdersRemoteDataSource {
  final LocalStorage _localStorage;
  final APIClient _apiClient;

  OrdersRemoteDataSourceImpl(this._localStorage, this._apiClient);

  @override
  Future<List<AppointmentEntity>> getOrdersList(
      String id, AppointmentForType orderForType, String? dateFor, String? dateFrom, String? dateTo) async {
    // await ConnectivityManager.checkInternetConnection();

    String queryField = "";

    switch (orderForType) {
      case AppointmentForType.SALON:
        queryField = "salonId";
        break;
      case AppointmentForType.SERVICE:
        queryField = "serviceId";
        break;
      case AppointmentForType.MASTER:
        queryField = "masterId";
        break;
      case AppointmentForType.USER:
        queryField = "userId";
        break;
    }

    final response =
        await _apiClient.getOrdersList({queryField: id, "dateFor": dateFor, "dateFrom": dateFrom, "dateTo": dateTo});

    if (response.data == null) {
      throw (Failure(message: response.message ?? "getOrdersList error: orders is null"));
    }

    return response.data!;
  }

  @override
  Future<List<AppointmentEntity>> getAvailableTime(String salonId, String serviceId, String masterId, String date) async {
    // await ConnectivityManager.checkInternetConnection();

    final response = await _apiClient.getAvailableTimeList(salonId, masterId, serviceId, date);

    if (response.data == null) {
      throw (Failure(message: response.message ?? "getOrdersList error: orders is null"));
    }

    return response.data!;
  }

  @override
  Future<void> removeOrder(String orderId) async {
    // await ConnectivityManager.checkInternetConnection();

    final response = await _apiClient.deleteOrder(orderId);

    return;
  }

  @override
  Future<AppointmentEntity> updateOrder(AppointmentEntity orderEntity) async {
    // await ConnectivityManager.checkInternetConnection();

    final response = await _apiClient.updateOrder(orderEntity);

    if (response.data == null) {
      throw (Failure(message: response.message ?? "updateOrder error: order is null"));
    }

    return response.data!;
  }

  @override
  Future<AppointmentEntity> addOrder(AppointmentEntity orderEntity) async {
    // await ConnectivityManager.checkInternetConnection();

    final response = await _apiClient.addOrder(orderEntity);

    if (response.data == null) {
      throw (Failure(message: response.message ?? "addOrder error: order is null"));
    }

    return response.data!;
  }
}
