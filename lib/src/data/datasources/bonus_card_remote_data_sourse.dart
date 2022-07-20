import 'package:salons_app_flutter_module/salons_app_flutter_module.dart';
import 'package:salons_app_flutter_module/src/data/datasources/api_client.dart';

abstract class BonusCardRemoteDataSource {
  Future<List<BonusCard>> getBonusCardList(String salonId);

  Future<BonusCard> addBonusCard(BonusCard bonusCard);

  Future<BonusCard> updateBonusCard(BonusCard bonusCard);

  Future<void> removeBonusCard(String bonusCardId);
}

class BonusCardRemoteDataSourceImpl implements BonusCardRemoteDataSource {
  final APIClient _apiClient;

  const BonusCardRemoteDataSourceImpl(this._apiClient);

  @override
  Future<List<BonusCard>> getBonusCardList(String salonId) async {
    // await ConnectivityManager.checkInternetConnection();

    final response = await _apiClient.getBonusCardList(salonId);

    if (response.data == null) {
      throw (Failure(message: response.message ?? "getBonusCardList error: data is null"));
    }

    // _localStorage.setBonusCardList(response.data ?? []);

    return response.data!;
  }

  @override
  Future<BonusCard> addBonusCard(BonusCard bonusCard) async {
    // await ConnectivityManager.checkInternetConnection();

    final response = await _apiClient.addBonusCard(bonusCard);

    if (response.data == null) {
      throw (Failure(message: response.message ?? "addMaster error: master is null"));
    }

    return response.data!;
  }

  @override
  Future<BonusCard> updateBonusCard(BonusCard bonusCard) async {
    // await ConnectivityManager.checkInternetConnection();

    final response = await _apiClient.updateBonusCard(bonusCard);

    if (response.data == null) {
      throw (Failure(message: response.message ?? "updateBonusCard error: data is null"));
    }

    return response.data!;
  }

  @override
  Future<void> removeBonusCard(String cardId) async {
    // await ConnectivityManager.checkInternetConnection();

    final response = await _apiClient.deleteBonusCard(cardId);

    return;
  }
}
