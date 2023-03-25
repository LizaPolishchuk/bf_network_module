import 'package:bf_network_module/src/api/api_client_mobile.dart';
import 'package:bf_network_module/src/utils/connectivity_manager.dart';
import 'package:bf_network_module/src/entities/requests/add_push_request.dart';
import 'package:bf_network_module/src/entities/responses/base_response.dart';

class PushRepository {
  final MobileApiClient _apiClient;

  PushRepository(this._apiClient);

  Future<BaseResponse> createPush(AddPushRequest request) async {
    await ConnectivityManager.checkInternetConnection();

    final response = await _apiClient.addPush(request);

    return response;
  }

  Future<BaseResponse> deletePush(String uuid) async {
    await ConnectivityManager.checkInternetConnection();

    final response = await _apiClient.deletePush(uuid);

    return response;
  }
}
