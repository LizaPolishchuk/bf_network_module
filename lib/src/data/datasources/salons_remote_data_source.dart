import 'package:salons_app_flutter_module/src/common/utils/failure.dart';
import 'package:salons_app_flutter_module/src/data/caches/local_starage.dart';
import 'package:salons_app_flutter_module/src/data/datasources/api_client.dart';
import 'package:salons_app_flutter_module/src/domain/entities/responses/salon_response.dart';
import 'package:salons_app_flutter_module/src/domain/entities/salon_entity.dart';

abstract class SalonsRemoteDataSource {
  Future<List<Salon>> getSalonsList(bool? loadTop, String? searchKey, int? page, int? limit);

  Future<Salon> getSalonById(String salonId);

  Future<Salon> updateSalon(Salon salonEntity);
}

class SalonsRemoteDataSourceImpl implements SalonsRemoteDataSource {
  LocalStorage _localStorage;
  APIClient _apiClient;

  SalonsRemoteDataSourceImpl(this._localStorage, this._apiClient);

  @override
  Future<List<Salon>> getSalonsList(bool? loadTop, String? searchKey, int? page, int? limit) async {
    final response = await _apiClient.getSalonList(loadTop, searchKey, page, limit);

    if (response.data == null) {
      throw (Failure(
          message: response.message ?? "getSalonsList error: data is null"));
    }

    return response.data!;
  }

  @override
  Future<Salon> updateSalon(Salon salon) async {
    final response = await _apiClient.updateSalon(salon);

    if (response.salon == null) {
      throw (Failure(
          message: response.message ?? "updateSalon error: salon is null"));
    }

    _saveSalonToLocalStorage(response);

    return response.salon!;
  }

  @override
  Future<Salon> getSalonById(String salonId) async {
    final response = await _apiClient.getSalon(salonId);

    if (response.salon == null) {
      throw (Failure(
          message: response.message ?? "getSalonById error: salon is null"));
    }

    Salon salon = response.salon!;
    salon.mastersList = response.masters ?? [];
    salon.servicesList = response.services ?? [];

    return salon;
  }

  Future<void> _saveSalonToLocalStorage(SalonResponse response) async {
    _localStorage.setSalon(response.salon!);
    _localStorage.setSalonId(response.salon!.id);
    _localStorage.setMastersList(response.masters ?? []);
    _localStorage.setServicesList(response.services ?? []);
  }
}
