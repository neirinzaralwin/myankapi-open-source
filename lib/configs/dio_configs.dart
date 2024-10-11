import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:myankapi/constants/app_pages.dart';
import 'package:myankapi/constants/routes.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioConfigs {
  final String baseUrl;
  final String token;
  DioConfigs({required this.baseUrl, required this.token});
  late Dio _dio;
  Dio init() {
    _dio = Dio(BaseOptions(baseUrl: baseUrl, headers: {
      "Content-Type": "application/json",
      "Accept": "application/json",
      // "authorization": "Myankapi $token"
    }));

    if (kDebugMode) {
      _dio.interceptors.add(PrettyDioLogger(
          // requestHeader: true,
          // requestBody: true,
          // responseBody: true,
          // responseHeader: true,
          // error: true,
          // compact: true,
          ));
    }
    _dio.interceptors.add(InterceptorsWrapper(onResponse: (response, handler) {
      handler.next(response);
    }, onError: ((error, handler) async {
      if (error.response?.statusCode == 401) {
        AppPages.router.goNamed(Routes.auth);
      } else {
        handler.next(error);
      }
    })));
    return _dio;
  }
}
