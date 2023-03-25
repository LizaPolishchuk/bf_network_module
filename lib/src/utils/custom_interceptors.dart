import 'package:bf_network_module/bf_network_module.dart';
import 'package:dio/dio.dart';

class CustomInterceptors extends Interceptor {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    String? authToken = await _firebaseAuth.currentUser?.getIdToken();
    assert(authToken != null);

    options.headers = {"authorization": "Bearer $authToken"};

    print(
        'http --> ${options.method} ${options.baseUrl}${options.path}${options.queryParameters} \n headers: ${options.headers} \n "data: ${options.data}');
    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    print(
        'http --> ${response.statusCode}  ${response.requestOptions.baseUrl}${response.requestOptions.path}, ${response.data}');
    return super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    // if (error.response?.statusCode == 403 ||
    //     error.response?.statusCode == 401) {
    //   await refreshToken();
    //   return _retry(error.request);
    // }

    print(
        'http --> ERROR[${err.response?.statusCode}] ${err.requestOptions.baseUrl}${err.requestOptions.path}, \n ${err.response?.statusMessage}');
    return super.onError(err, handler);
  }
}
