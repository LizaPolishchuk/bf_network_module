import 'package:shared_preferences/shared_preferences.dart';

const USER_ID = 'USER_ID';
const SALON_ID = 'SALON_ID';

abstract class LocalDataSource {
  Future<String?> getUserId();
  Future<void> saveUserId(String userId);
  Future<String?> getSalonId();
  Future<void> saveSalonId(String salonId);
}

class LocalDataSourceImpl implements LocalDataSource {
  SharedPreferences sharedPreferences;

  LocalDataSourceImpl(this.sharedPreferences);

  @override
  Future<String?> getUserId() async {
    return sharedPreferences.getString(USER_ID);
  }

  @override
  Future<bool> saveUserId(String userId) async {
    return sharedPreferences.setString(USER_ID, userId);
  }

  @override
  Future<String?> getSalonId() async {
    return sharedPreferences.getString(SALON_ID);
  }

  @override
  Future<bool> saveSalonId(String salonId) async {
    return sharedPreferences.setString(SALON_ID, salonId);
  }
}
