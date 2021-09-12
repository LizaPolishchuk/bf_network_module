import 'package:dio/dio.dart';

class CustomInterceptors extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    print('http --> ${options.method} ${options.baseUrl}${options.path} \n headers: ${options.headers} \n "data: ${options.data}');
    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    print('http --> ${response.statusCode}  ${response.requestOptions.baseUrl}${response.requestOptions.path}, ${response.data}');
    return super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    print('http --> ERROR[${err.response?.statusCode}] ${err.requestOptions.baseUrl}${err.requestOptions.path}, \n ${err.response?.statusMessage}');
    return super.onError(err, handler);
  }
}
