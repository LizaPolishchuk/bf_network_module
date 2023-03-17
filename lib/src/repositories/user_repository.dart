import 'package:bf_network_module/bf_network_module.dart';
import 'package:bf_network_module/src/api/api_client.dart';
import 'package:bf_network_module/src/entities/individual_appointment.dart';
import 'package:bf_network_module/src/entities/responses/base_response.dart';

class UserRepository {
  final APIClient _apiClient;
  final LocalStorage _localStorage;

  UserRepository(this._apiClient, this._localStorage);

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

  Future<void> switchThemeMode() async {
    return _localStorage.switchThemeMode();
  }

  Future<void> setCurrentLanguage(String locale) async {
    return _localStorage.setLanguage(locale);
  }

  Future<void> switchMasterMode(bool masterMode) async {
    return _localStorage.setMasterMode(masterMode);
  }
}
