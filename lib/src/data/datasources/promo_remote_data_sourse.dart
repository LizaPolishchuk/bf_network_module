import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:bf_network_module/src/common/utils/failure.dart';
import 'package:bf_network_module/src/data/caches/local_starage.dart';
import 'package:bf_network_module/src/data/datasources/api_client.dart';
import 'package:bf_network_module/src/domain/entities/promo_entity.dart';

abstract class PromoRemoteDataSource {
  Future<List<Promo>> getPromoList(String salonId);

  Future<Promo> addPromo(Promo promo);

  Future<Promo> updatePromo(Promo promo);

  Future<String> updatePromoPhoto(String id, PickedFile pickedFile);

  Future<void> removePromo(String promoId);
}

class PromoRemoteDataSourceImpl implements PromoRemoteDataSource {
  final APIClient _apiClient;
  LocalStorage _localStorage;
  late FirebaseStorage _firebaseStorage;

  PromoRemoteDataSourceImpl(this._localStorage, this._apiClient) {
    _firebaseStorage = FirebaseStorage.instance;
  }

  @override
  Future<List<Promo>> getPromoList(String salonId) async {
    // await ConnectivityManager.checkInternetConnection();

    final response = await _apiClient.getPromoList(salonId);

    if (response.data == null) {
      throw (Failure(message: response.message ?? "getPromoList error: data is null"));
    }

    // _localStorage.setPromoList(response.data ?? []);

    return response.data!;
  }

  @override
  Future<Promo> addPromo(Promo promo) async {
    // await ConnectivityManager.checkInternetConnection();

    final response = await _apiClient.addPromo(promo);

    if (response.data == null) {
      throw (Failure(message: response.message ?? "addMaster error: master is null"));
    }

    return response.data!;
  }

  @override
  Future<Promo> updatePromo(Promo promo) async {
    // await ConnectivityManager.checkInternetConnection();

    final response = await _apiClient.updatePromo(promo);

    if (response.data == null) {
      throw (Failure(message: response.message ?? "updatePromo error: data is null"));
    }

    return response.data!;
  }

  @override
  Future<String> updatePromoPhoto(String id, PickedFile pickedFile) async {
    String? currentSalonId = await _localStorage.getSalonId();

    assert(currentSalonId != null);

    var fileData = await pickedFile.readAsBytes();
    UploadTask uploadTask = _firebaseStorage.ref().child('/salon/$currentSalonId/promo/$id.png').putData(
          fileData,
          SettableMetadata(contentType: 'image/jpeg'),
        );

    var url = await (await uploadTask).ref.getDownloadURL();

    return url;
  }

  @override
  Future<void> removePromo(String promoId) async {
    // await ConnectivityManager.checkInternetConnection();

    final response = await _apiClient.deletePromo(promoId);

    return;
  }
}
