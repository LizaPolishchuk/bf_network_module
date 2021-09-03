
import 'package:hive/hive.dart';
import 'package:salons_app_flutter_module/src/domain/entities/master_entity.dart';
import 'package:salons_app_flutter_module/src/domain/entities/order_entity.dart';
import 'package:salons_app_flutter_module/src/domain/entities/salon_entity.dart';
import 'package:salons_app_flutter_module/src/domain/entities/service_entity.dart';

const int hiveTypeSalons = 0;
const int hiveTypeUsers = 1;
const int hiveTypeMasters = 2;
const int hiveTypeOrders = 3;
const int hiveTypeServices = 4;

class LocalStorage {
  late Box<dynamic> _box;

  static const _preferencesBox = '_preferencesBox';
  static const _firstLaunch = '_firstLaunch';
  static const _currentLanguage = '_currentLanguage';
  static const _dataVersions = '_dataVersions';
  static const _salon = '_salon';
  static const _salonId = '_salonId';
  static const _masters = '_masters';
  static const _services = '_services';
  static const _orders = '_orders';
  static const _userId = '_userId';
  static const _accessToken = '_accessToken';
  static const _refreshToken = '_refreshToken';

  Future openBox() async {
    this._box = await Hive.openBox<dynamic>(_preferencesBox);
  }

  bool isFirstLaunch() => _getValue(_firstLaunch) ?? true;

  Future setFirstLaunch(bool firstLaunch) =>
      _setValue(_firstLaunch, firstLaunch);

  getLanguage() => _getValue(_currentLanguage);

  Future setLanguage(String language) => _setValue(_currentLanguage, language);

  getSalon() => _getValue(_salon);

  Future setSalon(Salon salon) => _setValue(_salon, salon);

  getSalonId() => _getValue(_salonId);

  Future setSalonId(String salonId) => _setValue(_salonId, salonId);

  getUserId() => _getValue(_userId);

  Future setUserId(String userId) => _setValue(_userId, userId);

  getMastersList() => _getValue(_masters);

  Future setMastersList(List<Master> masters) => _setValue(_masters, masters);

  getServicesList() => _getValue(_services);

  Future setServicesList(List<Service> services) => _setValue(_services, services);

  getOrdersList() => _getValue(_orders);

  Future setOrdersList(List<OrderEntity> orders) => _setValue(_orders, orders);

  getCurrentUserId() => _getValue(_userId);

  Future setCurrentUserId(String userId) => _setValue(_userId, userId);

  getAccessToken() => _getValue(_accessToken);

  Future setAccessToken(String accessToken) => _setValue(_accessToken, accessToken);

  getRefreshToken() => _getValue(_refreshToken);

  Future setRefreshToken(String refreshToken) => _setValue(_refreshToken, refreshToken);

  T _getValue<T>(dynamic key, {T? defaultValue}) {
    return _box.get(key, defaultValue: defaultValue) as T;
  }

  Future _setValue<T>(dynamic key, T value) {
    return _box.put(key, value);
  }

  Future clear() {
    return _box.clear();
  }


}
