import 'package:bf_network_module/bf_network_module.dart';
import 'package:bf_network_module/src/api/api_client_web.dart';
import 'package:bf_network_module/src/entities/responses/base_response.dart';

class AdminRepository {
  final WebApiClient _apiClient;
  final LocalStorage _localStorage;

  AdminRepository(this._apiClient, this._localStorage);

  Future<BaseResponse> createAdmin(WebAdmin admin) async {
    await ConnectivityManager.checkInternetConnection();
    final response = await _apiClient.createAdmin(admin);
    return response;
  }

  Future<WebAdmin> getAdmin(String adminId) async {
    await ConnectivityManager.checkInternetConnection();
    final response = await _apiClient.getAdmin();
    return response;
  }

  Future<BaseResponse> updateAdmin(WebAdmin admin) async {
    await ConnectivityManager.checkInternetConnection();
    final response = await _apiClient.updateAdmin(admin);
    return response;
  }

  Future<BaseResponse> deleteAdmin() async {
    await ConnectivityManager.checkInternetConnection();
    final response = await _apiClient.deleteAdmin();
    return response;
  }

  Future<void> switchThemeMode() async {
    return _localStorage.switchThemeMode();
  }

  Future<void> setCurrentLanguage(String locale) async {
    return _localStorage.setLanguage(locale);
  }
}
