import 'package:salons_app_flutter_module/src/common/utils/failure.dart';
import 'package:salons_app_flutter_module/src/data/caches/local_starage.dart';
import 'package:salons_app_flutter_module/src/data/datasources/api_client.dart';
import 'package:salons_app_flutter_module/src/domain/entities/service_entity.dart';

abstract class ServiceRemoteDataSource {
  Future<List<Service>> getServicesList(String salonId);

  Future<Service> addService(Service service);

  Future<Service> updateService(Service service);

  Future<void> removeService(String serviceId);
}

class ServicesRemoteDataSourceImpl implements ServiceRemoteDataSource {
  final LocalStorage _localStorage;
  final APIClient _apiClient;

  const ServicesRemoteDataSourceImpl(this._localStorage, this._apiClient);

  @override
  Future<List<Service>> getServicesList(String salonId) async {
    final response = await _apiClient.getServiceList(salonId);

    if (response.data == null) {
      throw (Failure(
          message: response.message ?? "getServicesList error: data is null"));
    }

    _localStorage.setServicesList(response.data ?? []);

    return response.data!;
  }

  @override
  Future<Service> addService(Service service) async {
    final response = await _apiClient.addService(service);

    if (response.data == null) {
      throw (Failure(
          message: response.message ?? "addMaster error: master is null"));
    }

    return response.data!;
  }

  @override
  Future<Service> updateService(Service service) async {
    final response = await _apiClient.updateService(service);

    if (response.data == null) {
      throw (Failure(
          message: response.message ?? "updateService error: data is null"));
    }

    return response.data!;
  }

  @override
  Future<void> removeService(String serviceId) async {
    final response = await _apiClient.deleteService(serviceId);

    return;
  }
}