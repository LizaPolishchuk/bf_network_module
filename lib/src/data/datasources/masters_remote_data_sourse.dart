import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:bf_network_module/src/common/utils/connectivity_manager.dart';
import 'package:bf_network_module/src/common/utils/failure.dart';
import 'package:bf_network_module/src/data/caches/local_starage.dart';
import 'package:bf_network_module/src/data/datasources/api_client.dart';
import 'package:bf_network_module/src/domain/entities/master_entity.dart';

abstract class MastersRemoteDataSource {
  Future<List<Master>> getMastersList(String salonId, String? serviceId);

  Future<Master> updateMaster(Master master);

  Future<String> updateMasterPhoto(String id, PickedFile pickedFile);

  Future<Master> addMaster(Master master);

  Future<void> removeMaster(String masterId);
}

class MastersRemoteDataSourceImpl implements MastersRemoteDataSource {
  final LocalStorage _localStorage;
  final APIClient _apiClient;
  late FirebaseStorage _firebaseStorage;

  MastersRemoteDataSourceImpl(this._localStorage, this._apiClient) {
    _firebaseStorage = FirebaseStorage.instance;
  }

  @override
  Future<List<Master>> getMastersList(String salonId, String? serviceId) async {
    // await ConnectivityManager.checkInternetConnection();

    final response = await _apiClient.getMastersList(salonId, serviceId);

    if (response.data == null) {
      throw (Failure(message: response.message ?? "getMastersList error: data is null"));
    }

    _localStorage.setMastersList(response.data ?? []);

    return response.data!;
  }

  @override
  Future<Master> updateMaster(Master master) async {
    // await ConnectivityManager.checkInternetConnection();

    final response = await _apiClient.updateMaster(master);

    if (response.data == null) {
      throw (Failure(message: response.message ?? "updateMaster error: master is null"));
    }

    // _localStorage.setMastersList(response.masters ?? []);
    // _localStorage.setServicesList(response.services ?? []);

    return response.data!;
  }

  @override
  Future<String> updateMasterPhoto(String id, PickedFile pickedFile) async {
    String? currentSalonId = await _localStorage.getSalonId();

    assert(currentSalonId != null);

    var fileData = await pickedFile.readAsBytes();
    UploadTask uploadTask = _firebaseStorage.ref().child('/salon/$currentSalonId/masters/$id.png').putData(
          fileData,
          SettableMetadata(contentType: 'image/jpeg'),
        );

    var url = await (await uploadTask).ref.getDownloadURL();

    return url;
  }

  @override
  Future<void> removeMaster(String masterId) async {
    // await ConnectivityManager.checkInternetConnection();

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
    // await ConnectivityManager.checkInternetConnection();

    final response = await _apiClient.addMaster(master);

    if (response.data == null) {
      throw (Failure(message: response.message ?? "addMaster error: master is null"));
    }

    // _localStorage.setMastersList(response.masters ?? []);
    // _localStorage.setServicesList(response.services ?? []);

    return response.data!;
  }
}
