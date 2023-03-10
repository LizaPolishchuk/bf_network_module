import 'package:salons_app_flutter_module/src/api/api_client.dart';
import 'package:salons_app_flutter_module/src/utils/connectivity_manager.dart';
import 'package:salons_app_flutter_module/src/entities/appointment_entity.dart';
import 'package:salons_app_flutter_module/src/entities/individual_appointment.dart';
import 'package:salons_app_flutter_module/src/entities/master_entity.dart';
import 'package:salons_app_flutter_module/src/entities/responses/base_response.dart';
import 'package:salons_app_flutter_module/src/entities/salon_entity.dart';
import 'package:salons_app_flutter_module/src/entities/user_entity.dart';

class UserRepository {
  final APIClient _apiClient;

  UserRepository(this._apiClient);

  Future<BaseResponse> createUser(UserEntity user) async {
    await ConnectivityManager.checkInternetConnection();

    final response = await _apiClient.createUser(user);

    return response;
  }

  Future<UserEntity> getUser(String userId) async {
    await ConnectivityManager.checkInternetConnection();

    final response = await _apiClient.getUser(userId);

    return response;
  }

  Future<BaseResponse> updateUser(UserEntity user) async {
    await ConnectivityManager.checkInternetConnection();

    final response = await _apiClient.updateUser(
        "NblCTFi6TwCuCft1NP64Pg",
        // user.id,
        user);

    return response;
  }

  Future<BaseResponse> deleteUser(String userId) async {
    await ConnectivityManager.checkInternetConnection();

    final response = await _apiClient.deleteUser(userId);

    return response;
  }

  Future<List<Master>> getUserMasters(String userId) async {
    await ConnectivityManager.checkInternetConnection();

    final response = await _apiClient.getUserMasters(userId);

    return response;
  }

  Future<List<IndividualAppointment>> getUserIndividualAppointments(String userId) async {
    await ConnectivityManager.checkInternetConnection();

    final response = await _apiClient.getUserIndividualAppointments(userId);

    return response;
  }

  Future<List<Salon>> getUserFavouriteSalons(String userId) async {
    await ConnectivityManager.checkInternetConnection();

    final response = await _apiClient.getUserFavouriteSalons(userId);

    return response;
  }
}
