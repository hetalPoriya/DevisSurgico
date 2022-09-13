import 'package:dio/dio.dart';
import 'package:driver_apps/api/serverConstant.dart';

import '../../main.dart';

class ApiHelper {
  static Dio getDioClient() {
    Map<String, dynamic> customHeader = {
      'Content-Type': 'application/json',
    };
    final BaseOptions options = BaseOptions(
      baseUrl: ServerConstants.BASE_URL,
      connectTimeout: 20000,
      receiveTimeout: 20000,
      headers: customHeader,
      followRedirects: false,
      validateStatus: (status) {
        return status! < 500;
      },
    );
    Dio dio = Dio(options);
    dio.interceptors.add(LogInterceptor(responseBody: true));
    return dio;
  }

  static Dio getDioClientWithUrlencoded() {
    Map<String, dynamic> customHeader = {
      'Content-Type': 'application/x-www-form-urlencoded',
    };
    final BaseOptions options = BaseOptions(
      baseUrl: ServerConstants.BASE_URL,
      connectTimeout: 20000,
      receiveTimeout: 20000,
      headers: customHeader,
      followRedirects: false,
      validateStatus: (status) {
        return status! < 500;
      },
    );
    Dio dio = Dio(options);
    dio.interceptors.add(LogInterceptor(responseBody: true));
    return dio;
  }
}
