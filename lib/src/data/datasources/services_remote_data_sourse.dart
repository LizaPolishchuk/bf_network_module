import 'package:bf_network_module/src/common/utils/connectivity_manager.dart';
import 'package:bf_network_module/src/common/utils/failure.dart';
import 'package:bf_network_module/src/data/caches/local_starage.dart';
import 'package:bf_network_module/src/data/datasources/api_client.dart';
import 'package:bf_network_module/src/domain/entities/service_entity.dart';

abstract class ServiceRemoteDataSource {
  Future<List<Service>> getServicesList(String salonId, String? categoryId);

  Future<Service> addService(Service service);

  Future<Service> updateService(Service service);

  Future<void> removeService(String serviceId);
}

class ServicesRemoteDataSourceImpl implements ServiceRemoteDataSource {
  final LocalStorage _localStorage;
  final APIClient _apiClient;

  const ServicesRemoteDataSourceImpl(this._localStorage, this._apiClient);

  @override
  Future<List<Service>> getServicesList(String salonId, String? categoryId) async {
    // await ConnectivityManager.checkInternetConnection();

    final response = await _apiClient.getServiceList(salonId, categoryId);

    if (response.data == null) {
      throw (Failure(message: response.message ?? "getServicesList error: data is null"));
    }

    _localStorage.setServicesList(response.data ?? []);

    return response.data!;
  }

  @override
  Future<Service> addService(Service service) async {
    // await ConnectivityManager.checkInternetConnection();

    final response = await _apiClient.addService(service);

    if (response.data == null) {
      throw (Failure(message: response.message ?? "addMaster error: master is null"));
    }

    return response.data!;
  }

  @override
  Future<Service> updateService(Service service) async {
    // await ConnectivityManager.checkInternetConnection();

    final response = await _apiClient.updateService(service);

    if (response.data == null) {
      throw (Failure(message: response.message ?? "updateService error: data is null"));
    }

    return response.data!;
  }

  @override
  Future<void> removeService(String serviceId) async {
    // await ConnectivityManager.checkInternetConnection();

    final response = await _apiClient.deleteService(serviceId);

    return;
  }
}
