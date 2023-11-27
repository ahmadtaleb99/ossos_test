import 'package:dio/dio.dart';
import 'package:ossos_test/data/network/api_constants.dart';

class DioFactory {
  static Map<String, String> _headers = {};

  static Map<String, String> get getDefaultHeaders => _headers;

  Future<Dio> getDio() async {
    final dio = Dio();
    _headers = {
      CONTENT_TYPE: APPLICATION_JSON,
      ACCEPT: APPLICATION_JSON,
    };

    dio.options = BaseOptions(
        baseUrl: ApiConstants.baseUrl,
        headers: _headers,
        receiveTimeout: const Duration(seconds: ApiConstants.apiTimeOut),
        sendTimeout: const Duration(seconds: ApiConstants.apiTimeOut));

    return dio;
  }

  DioFactory();
}
