import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:salons_app_flutter_module/src/common/utils/failure.dart';
import 'package:salons_app_flutter_module/src/data/caches/local_starage.dart';
import 'package:salons_app_flutter_module/src/data/datasources/api_client.dart';
import 'package:salons_app_flutter_module/src/domain/entities/master_entity.dart';

const MASTERS_COLLECTION = 'masters';

abstract class MastersRemoteDataSource {
  Future<List<Master>> getMastersList(String salonId);

  Future<Master> updateMaster(Master master);

  Future<Master> addMaster(Master master);

  Future<void> removeMaster(String masterId);
}

class MastersRemoteDataSourceImpl implements MastersRemoteDataSource {
  late CollectionReference mastersCollection;
  LocalStorage _localStorage;
  APIClient _apiClient;

  MastersRemoteDataSourceImpl(this._localStorage, this._apiClient) {
    mastersCollection =
        FirebaseFirestore.instance.collection(MASTERS_COLLECTION);
  }

  @override
  Future<List<Master>> getMastersList(String salonId) async {
    print("getMastersList: $salonId");
    final response = await _apiClient.getMastersList(salonId);

    if (response.data == null) {
      throw(Failure(message: response.message ?? "getMastersList error: data is null"));
    }

    _localStorage.setMastersList(response.data ?? []);

    print("getMastersList response: ${response.data}");

    return response.data!;
  }

  @override
  Future<Master> updateMaster(Master master) async {
    final response = await _apiClient.updateMaster(master);

    if (response.data == null) {
      throw(Failure(message: response.message ?? "updateMaster error: master is null"));
    }

    // _localStorage.setMastersList(response.masters ?? []);
    // _localStorage.setServicesList(response.services ?? []);

    return response.data!;
  }

  @override
  Future<void> removeMaster(String masterId) async {
    final response = await _apiClient.deleteMaster(masterId);

    // if (response.data == null) {
    //   throw(Failure(message: response.message ?? "updateMaster error: master is null"));
    // }

    // _localStorage.setMastersList(response.masters ?? []);
    // _localStorage.setServicesList(response.services ?? []);

    return;
  }

  @override
  Future<Master> addMaster(Master master) async {
    final response = await _apiClient.addMaster(master);

    if (response.data == null) {
      throw(Failure(message: response.message ?? "addMaster error: master is null"));
    }

    // _localStorage.setMastersList(response.masters ?? []);
    // _localStorage.setServicesList(response.services ?? []);

    return response.data!;
  }
}
