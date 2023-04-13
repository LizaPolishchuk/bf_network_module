import 'package:bf_network_module/src/api/api_client_web.dart';
import 'package:bf_network_module/src/entities/responses/salon_exists_response.dart';
import 'package:bf_network_module/src/utils/connectivity_manager.dart';
import 'package:bf_network_module/src/entities/feedback_entity.dart';
import 'package:bf_network_module/src/entities/requests/like_salon_request.dart';
import 'package:bf_network_module/src/entities/responses/base_response.dart';
import 'package:bf_network_module/src/entities/salon_entity.dart';
import 'package:bf_network_module/src/entities/user_entity.dart';

class SalonRepository {
  final WebApiClient _apiClient;

  SalonRepository(this._apiClient);

  Future<BaseResponse> createSalon(Salon salon) async {
    await ConnectivityManager.checkInternetConnection();

    final response = await _apiClient.addSalon(salon);

    return response;
  }

  Future<Salon> getSalon() async {
    await ConnectivityManager.checkInternetConnection();

    final response = await _apiClient.getSalon();

    return response;
  }

  Future<Salon> getSalonById(String uuid) async {
    await ConnectivityManager.checkInternetConnection();

    final response = await _apiClient.getSalon();

    return response;
  }

  Future<bool> checkIfSalonExists() async {
    await ConnectivityManager.checkInternetConnection();

    final response = await _apiClient.checkIfSalonExists();

    return response.exist;
  }

  Future<BaseResponse> updateSalon(Salon salon) async {
    await ConnectivityManager.checkInternetConnection();

    final response = await _apiClient.updateSalon(salon);

    return response;
  }

  Future<BaseResponse> deleteSalon(String uuid) async {
    await ConnectivityManager.checkInternetConnection();

    final response = await _apiClient.deleteSalon();

    return response;
  }

  Future<List<UserEntity>> getSalonClients(String uuid) async {
    await ConnectivityManager.checkInternetConnection();

    final response = await _apiClient.getSalonClients(uuid);

    return response;
  }

  Future<List<FeedbackEntity>> getSalonFeedbacks(String uuid) async {
    await ConnectivityManager.checkInternetConnection();

    final response = await _apiClient.getSalonFeedbacks(uuid);

    return response;
  }

  Future<BaseResponse> likeSalon(LikeSalonRequest request) async {
    await ConnectivityManager.checkInternetConnection();

    final response = await _apiClient.likeSalon(request);

    return response;
  }
}
