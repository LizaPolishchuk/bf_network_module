import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:bf_network_module/bf_network_module.dart';
import 'package:bf_network_module/src/common/utils/connectivity_manager.dart';
import 'package:bf_network_module/src/common/utils/failure.dart';
import 'package:bf_network_module/src/data/caches/local_starage.dart';
import 'package:bf_network_module/src/data/datasources/api_client.dart';
import 'package:bf_network_module/src/domain/entities/responses/salon_response.dart';
import 'package:bf_network_module/src/domain/entities/salon_entity.dart';
// import 'package:universal_html/prefer_universal/html.dart' as html;

abstract class SalonsRemoteDataSource {
  Future<List<Salon>> getSalonsList(
      bool? loadTop, String? searchKey, int? page, int? limit, SearchFilters? searchFilters);

  Future<Salon> getSalonById(String salonId);

  Future<Salon> updateSalon(Salon salonEntity);

  Future<String> updateSalonPhoto(PickedFile avatar);
}

class SalonsRemoteDataSourceImpl implements SalonsRemoteDataSource {
  LocalStorage _localStorage;
  APIClient _apiClient;
  late FirebaseStorage _firebaseStorage;

  SalonsRemoteDataSourceImpl(this._localStorage, this._apiClient) {
    _firebaseStorage = FirebaseStorage.instance;
  }

  @override
  Future<List<Salon>> getSalonsList(
      bool? loadTop, String? searchKey, int? page, int? limit, SearchFilters? searchFilters) async {
    // await ConnectivityManager.checkInternetConnection();

    final response = await _apiClient.getSalonList(loadTop, searchKey, page, limit, searchFilters?.toJson());

    if (response.data == null) {
      throw (Failure(message: response.message ?? "getSalonsList error: data is null"));
    }

    return response.data!;
  }

  @override
  Future<Salon> updateSalon(Salon salon) async {
    // await ConnectivityManager.checkInternetConnection();

    final response = await _apiClient.updateSalon(salon);

    print("response: ${response.toJson()}");

    if (response.salon == null) {
      throw (Failure(message: response.message ?? "updateSalon error: salon is null"));
    }

    _saveSalonToLocalStorage(response);

    return response.salon!;
  }

  @override
  Future<String> updateSalonPhoto(PickedFile pickedFile) async {
    String? currentSalonId = await _localStorage.getSalonId();

    assert(currentSalonId != null);

    var fileData = await pickedFile.readAsBytes();
    UploadTask uploadTask = _firebaseStorage.ref().child('/salon/$currentSalonId/media/profile_pic.png').putData(
          fileData,
          SettableMetadata(contentType: 'image/jpeg'),
        );

    var url = await (await uploadTask).ref.getDownloadURL();

    return url;
  }

  @override
  Future<Salon> getSalonById(String salonId) async {
    // await ConnectivityManager.checkInternetConnection();

    final response = await _apiClient.getSalon(salonId);

    if (response.salon == null) {
      throw (Failure(message: response.message ?? "getSalonById error: salon is null"));
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
