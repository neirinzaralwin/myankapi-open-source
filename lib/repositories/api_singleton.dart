import 'package:dio/dio.dart';
import 'auth/auth_repository.dart';
import 'service/service_repository.dart';

class ApiSingleton {
  static Dio? dio;
  static AuthRepository? _authRepo;
  static ServiceRepository? _serviceRepo;

  static AuthRepository get auth {
    _authRepo ??= AuthRepository(dio ?? Dio());
    return _authRepo!;
  }

  static ServiceRepository get service {
    _serviceRepo ??= ServiceRepository(dio ?? Dio());
    return _serviceRepo!;
  }
}
