import 'package:salons_app_flutter_module/src/common/utils/connectivity_manager.dart';
import 'package:salons_app_flutter_module/src/common/utils/failure.dart';
import 'package:salons_app_flutter_module/src/data/datasources/api_client.dart';
import 'package:salons_app_flutter_module/src/domain/entities/filters_entity.dart';

abstract class FiltersRemoteDataSource {
  Future<Filters> getFilters();

  Future<Filters> addFilters(Filters filtersEntity);

  Future<Filters> updateFilters(Filters filtersEntity);

  Future<void> removeFilters(String filterId);
}

class FiltersRemoteDataSourceImpl implements FiltersRemoteDataSource {
  final APIClient _apiClient;

  const FiltersRemoteDataSourceImpl(this._apiClient);

  @override
  Future<Filters> getFilters() async {
    // await ConnectivityManager.checkInternetConnection();

    final response = await _apiClient.getFilters();

    if (response.data == null) {
      throw (Failure(message: response.message ?? "getFilters error: data is null"));
    }

    return response.data!;
  }

  @override
  Future<Filters> addFilters(Filters filtersEntity) async {
    // await ConnectivityManager.checkInternetConnection();

    final response = await _apiClient.addFilters(filtersEntity);

    if (response.data == null) {
      throw (Failure(message: response.message ?? "addFilters error: master is null"));
    }

    return response.data!;
  }

  @override
  Future<Filters> updateFilters(Filters filtersEntity) async {
    // await ConnectivityManager.checkInternetConnection();

    final response = await _apiClient.updateFilters(filtersEntity);

    if (response.data == null) {
      throw (Failure(message: response.message ?? "updateFilters error: data is null"));
    }

    return response.data!;
  }

  @override
  Future<void> removeFilters(String filterId) async {
    // await ConnectivityManager.checkInternetConnection();

    final response = await _apiClient.deleteFilters(filterId);

    return;
  }
}
