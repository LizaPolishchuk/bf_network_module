import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:salons_app_flutter_module/src/common/utils/failure.dart';
import 'package:salons_app_flutter_module/src/data/caches/local_starage.dart';
import 'package:salons_app_flutter_module/src/data/datasources/api_client.dart';
import 'package:salons_app_flutter_module/src/domain/entities/master_entity.dart';
import 'package:salons_app_flutter_module/src/domain/entities/responses/salon_response.dart';
import 'package:salons_app_flutter_module/src/domain/entities/salon_entity.dart';
import 'package:salons_app_flutter_module/src/domain/entities/service_entity.dart';

const SALONS_COLLECTION = 'salons';
const SERVICES_COLLECTION = 'services';
const MASTERS_COLLECTION = 'masters';
const AVAILABLE_TIMES_COLLECTION = 'available_times';

abstract class SalonsRemoteDataSource {
  Future<List<Salon>> getSalonsList(bool? loadTop);

  Future<Salon> getSalonById(String salonId);

  Future<Salon> updateSalon(Salon salonEntity);
}

class SalonsRemoteDataSourceImpl implements SalonsRemoteDataSource {
  late CollectionReference salonsCollection;
  late CollectionReference mastersCollection;
  LocalStorage _localStorage;
  APIClient _apiClient;

  SalonsRemoteDataSourceImpl(this._localStorage, this._apiClient) {
    salonsCollection = FirebaseFirestore.instance.collection(SALONS_COLLECTION);
    mastersCollection =
        FirebaseFirestore.instance.collection(MASTERS_COLLECTION);
  }

  @override
  Future<List<Salon>> getSalonsList(bool? loadTop) async {
    final response = await _apiClient.getSalonList(loadTop);

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

    return response.salon!;
  }

  Future<void> _saveSalonToLocalStorage(SalonResponse response) async {
    _localStorage.setSalon(response.salon!);
    _localStorage.setSalonId(response.salon!.id);
    _localStorage.setMastersList(response.masters ?? []);
    _localStorage.setServicesList(response.services ?? []);
  }
}
