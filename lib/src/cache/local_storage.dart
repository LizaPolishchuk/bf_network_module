import 'package:hive/hive.dart';
import 'package:bf_network_module/src/entities/user_entity.dart';

// const int hiveTypeSalons = 0;
// const int hiveTypeUsers = 1;
// const int hiveTypeMasters = 2;
// const int hiveTypeAppointments = 3;
// const int hiveTypeServices = 4;
// const int hiveTypeCategories = 5;
// const int hiveTypeClients = 6;
// const int hiveTypePromos = 7;
// const int hiveTypeBonusCards = 8;
// const int hiveTypeFeedback = 9;
// const int hiveTypeIndividualAppointments = 10;

class LocalStorage {
  late Box<dynamic> _box;

  static const preferencesBox = '_preferencesBox';
  static const _firstLaunch = '_firstLaunch';
  static const currentLanguage = '_currentLanguage';
  static const _salonId = '_salonId';
  static const _salonName = '_salonName';
  static const _userId = '_userId';
  static const _user = '_user';
  static const _accessToken = '_accessToken';
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

  getSalonId() => _getValue(_salonId);

  Future setSalonId(String salonId) => _setValue(_salonId, salonId);

  getSalonName() => _getValue(_salonName);

  Future setSalonName(String salonName) => _setValue(_salonName, salonName);

  getUserId() => _getValue(_userId);

  Future setUserId(String userId) => _setValue(_userId, userId);

  getCurrentUser() => _getValue(_user);

  Future setCurrentUser(UserEntity user) => _setValue(_user, user);

  getAccessToken() => _getValue(_accessToken);

  Future setAccessToken(String token) => _setValue(_accessToken, token);

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
