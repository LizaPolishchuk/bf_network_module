import 'package:salons_app_flutter_module/src/api/api_client.dart';
import 'package:salons_app_flutter_module/src/utils/connectivity_manager.dart';
import 'package:salons_app_flutter_module/src/entities/promo_entity.dart';
import 'package:salons_app_flutter_module/src/entities/responses/base_response.dart';

class PromoRepository {
  final APIClient _apiClient;

  PromoRepository(this._apiClient);

  Future<BaseResponse> createPromo(Promo promo) async {
    await ConnectivityManager.checkInternetConnection();

    final response = await _apiClient.addPromo(promo);

    return response;
  }

  Future<Promo> getPromo(String userId) async {
    await ConnectivityManager.checkInternetConnection();

    final response = await _apiClient.getPromo(userId);

    return response;
  }

  Future<BaseResponse> updatePromo(Promo promo) async {
    await ConnectivityManager.checkInternetConnection();

    final response = await _apiClient.updatePromo(promo.id, promo);

    return response;
  }

  Future<List<Promo>> getSalonPromos(String uuid) async {
    await ConnectivityManager.checkInternetConnection();

    final response = await _apiClient.getSalonPromos(uuid);

    return response;
  }

  Future<BaseResponse> deletePromo(String userId) async {
    await ConnectivityManager.checkInternetConnection();

    final response = await _apiClient.deletePromo(userId);

    return response;
  }
}
