import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:bf_network_module/bf_network_module.dart';
import 'package:bf_network_module/src/data/datasources/api_client.dart';

abstract class ClientRemoteDataSource {
  Future<List<Client>> getClientList(String salonId);

  Future<Client> addClient(Client client);

  Future<Client> updateClient(Client client);

  Future<String> updateClientPhoto(String id, PickedFile pickedFile);

  Future<void> removeClient(String clientId);
}

class ClientRemoteDataSourceImpl implements ClientRemoteDataSource {
  final APIClient _apiClient;
  LocalStorage _localStorage;
  late FirebaseStorage _firebaseStorage;

  ClientRemoteDataSourceImpl(this._localStorage, this._apiClient) {
    _firebaseStorage = FirebaseStorage.instance;
  }

  @override
  Future<List<Client>> getClientList(String salonId) async {
    // await ConnectivityManager.checkInternetConnection();

    final response = await _apiClient.getClientList(salonId);

    if (response.data == null) {
      throw (Failure(message: response.message ?? "getClientList error: data is null"));
    }

    // _localStorage.setClientList(response.data ?? []);

    return response.data!;
  }

  @override
  Future<Client> addClient(Client client) async {
    // await ConnectivityManager.checkInternetConnection();

    final response = await _apiClient.addClient(client);

    if (response.data == null) {
      throw (Failure(message: response.message ?? "addMaster error: master is null"));
    }

    return response.data!;
  }

  @override
  Future<Client> updateClient(Client client) async {
    // await ConnectivityManager.checkInternetConnection();

    final response = await _apiClient.updateClient(client);

    if (response.data == null) {
      throw (Failure(message: response.message ?? "updateClient error: data is null"));
    }

    return response.data!;
  }

  @override
  Future<String> updateClientPhoto(String id, PickedFile pickedFile) async {
    String? currentSalonId = await _localStorage.getSalonId();

    assert(currentSalonId != null);

    var fileData = await pickedFile.readAsBytes();
    UploadTask uploadTask = _firebaseStorage.ref().child('/salon/$currentSalonId/clients/$id.png').putData(
          fileData,
          SettableMetadata(contentType: 'image/jpeg'),
        );

    var url = await (await uploadTask).ref.getDownloadURL();

    return url;
  }

  @override
  Future<void> removeClient(String clientId) async {
    // await ConnectivityManager.checkInternetConnection();

    final response = await _apiClient.deleteClient(clientId);

    return;
  }
}
