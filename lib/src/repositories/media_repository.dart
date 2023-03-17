import 'package:bf_network_module/src/api/api_client.dart';
import 'package:bf_network_module/src/utils/connectivity_manager.dart';
import 'package:bf_network_module/src/entities/requests/upload_photo_request.dart';
import 'package:bf_network_module/src/entities/responses/base_response.dart';
import 'package:bf_network_module/src/entities/responses/signed_url_response.dart';

class MediaRepository {
  final APIClient _apiClient;

  MediaRepository(this._apiClient);

  Future<SignedUrlResponse> getSignedUrl() async {
    await ConnectivityManager.checkInternetConnection();

    final response = await _apiClient.getSignedUrl();

    return response;
  }

  Future<BaseResponse> uploadPhoto(UploadPhotoRequest request) async {
    await ConnectivityManager.checkInternetConnection();

    final response = await _apiClient.uploadPhoto(request);

    return response;
  }
}
