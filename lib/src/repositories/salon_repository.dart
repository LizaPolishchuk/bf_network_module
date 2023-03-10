import 'package:salons_app_flutter_module/src/api/api_client.dart';
import 'package:salons_app_flutter_module/src/utils/connectivity_manager.dart';
import 'package:salons_app_flutter_module/src/entities/appointment_entity.dart';
import 'package:salons_app_flutter_module/src/entities/feedback_entity.dart';
import 'package:salons_app_flutter_module/src/entities/master_entity.dart';
import 'package:salons_app_flutter_module/src/entities/promo_entity.dart';
import 'package:salons_app_flutter_module/src/entities/requests/like_salon_request.dart';
import 'package:salons_app_flutter_module/src/entities/responses/base_response.dart';
import 'package:salons_app_flutter_module/src/entities/salon_entity.dart';
import 'package:salons_app_flutter_module/src/entities/service_entity.dart';
import 'package:salons_app_flutter_module/src/entities/user_entity.dart';

class SalonRepository {
  final APIClient _apiClient;

  SalonRepository(this._apiClient);

  Future<BaseResponse> createSalon(Salon salon) async {
    await ConnectivityManager.checkInternetConnection();

    final response = await _apiClient.addSalon(salon);

    return response;
  }

  Future<Salon> getSalon(String uuid) async {
    await ConnectivityManager.checkInternetConnection();

    final response = await _apiClient.getSalon(uuid);

    return response;
  }

  Future<BaseResponse> updateSalon(Salon salon) async {
    await ConnectivityManager.checkInternetConnection();

    final response = await _apiClient.updateSalon(salon.id, salon);

    return response;
  }

  Future<BaseResponse> deleteSalon(String uuid) async {
    await ConnectivityManager.checkInternetConnection();

    final response = await _apiClient.deleteSalon(uuid);

    return response;
  }

  Future<List<Master>> getSalonMasters(String uuid) async {
    await ConnectivityManager.checkInternetConnection();

    final response = await _apiClient.getSalonMasters(uuid);

    return response;
  }

  Future<List<Service>> getSalonServices(String uuid) async {
    await ConnectivityManager.checkInternetConnection();

    final response = await _apiClient.getSalonServices(uuid);

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
