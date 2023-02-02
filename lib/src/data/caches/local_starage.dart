import 'dart:ui';

import 'package:hive/hive.dart';
import 'package:salons_app_flutter_module/salons_app_flutter_module.dart';
import 'package:salons_app_flutter_module/src/domain/entities/category_entity.dart';
import 'package:salons_app_flutter_module/src/domain/entities/master_entity.dart';
import 'package:salons_app_flutter_module/src/domain/entities/order_entity.dart';
import 'package:salons_app_flutter_module/src/domain/entities/salon_entity.dart';
import 'package:salons_app_flutter_module/src/domain/entities/service_entity.dart';

const int hiveTypeSalons = 0;
const int hiveTypeUsers = 1;
const int hiveTypeMasters = 2;
const int hiveTypeOrders = 3;
const int hiveTypeServices = 4;
const int hiveTypeCategories = 5;
const int hiveTypeClients = 6;
const int hiveTypePromos = 7;
const int hiveTypeBonusCards = 8;
const int hiveTypeFeedback = 9;

class LocalStorage {
  late Box<dynamic> _box;

  static const preferencesBox = '_preferencesBox';
  static const _firstLaunch = '_firstLaunch';
  static const currentLanguage = '_currentLanguage';
  static const _dataVersions = '_dataVersions';
  static const _salon = '_salon';
  static const _salonId = '_salonId';
  static const _masters = '_masters';
  static const _services = '_services';
  static const _orders = '_orders';
  static const _categories = '_categories';
  static const _userId = '_userId';
  static const _user = '_user';
  static const accessToken = '_accessToken';
  static const _refreshToken = '_refreshToken';
  static const themeMode = '_themeMode';
  static const masterMode = '_masterMode';

  Future openBox() async {
    this._box = await Hive.openBox<dynamic>(preferencesBox);
  }

  bool isFirstLaunch() => _getValue(_firstLaunch) ?? true;

  Future setFirstLaunch(bool firstLaunch) => _setValue(_firstLaunch, firstLaunch);

  getLanguage() => _getValue(currentLanguage);

  Future setLanguage(String locale) => _setValue(currentLanguage, locale);

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

  getCategoriesList() => _getValue(_categories);

  Future setCategoriesList(List<Category> categories) => _setValue(_categories, categories);

  getCurrentUserId() => _getValue(_userId);

  Future setCurrentUserId(String userId) => _setValue(_userId, userId);

  getCurrentUser() => _getValue(_user);

  Future setCurrentUser(UserEntity user) => _setValue(_user, user);

  getAccessToken() => _getValue(accessToken);

  Future setAccessToken(String token) => _setValue(accessToken, token);

  getRefreshToken() => _getValue(_refreshToken);

  Future setRefreshToken(String refreshToken) => _setValue(_refreshToken, refreshToken);

  bool get getThemeMode => _getValue<bool?>(themeMode) ?? true;

  Future switchThemeMode() => _setValue(themeMode, !getThemeMode);

  bool get isMasterMode => _getValue<bool?>(masterMode) ?? false;

  Future setMasterMode(bool value) => _setValue(masterMode, value);

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
