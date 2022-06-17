import 'package:connectivity_plus/connectivity_plus.dart';

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
