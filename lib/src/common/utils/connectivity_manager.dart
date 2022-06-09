import 'package:connectivity/connectivity.dart';
import 'package:salons_app_flutter_module/salons_app_flutter_module.dart';

class ConnectivityManager {
  static Future<bool> checkInternetConnection() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      return true;
    } else {
      return false;
      // throw(NoInternetException.noInternetCode);
    }
  }
}

class NoInternetException implements Exception {
  static final String noInternetMessage = "No Internet Connection";
  static final String noInternetCode = "no_internet_connection";
}
