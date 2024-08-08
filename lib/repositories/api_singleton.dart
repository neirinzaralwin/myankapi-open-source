import 'package:dio/dio.dart';
import 'package:myankapi/repositories/shop/shop_repository.dart';
import 'auth/auth_repository.dart';
import 'service/service_repository.dart';

class ApiSingleton {
  static Dio? dio;
  static AuthRepository? _authRepo;
  static ServiceRepository? _serviceRepo;
  static ShopRepository? _shopRepo;

  static AuthRepository get auth {
    _authRepo ??= AuthRepository(dio ?? Dio());
    return _authRepo!;
  }

  static ServiceRepository get service {
    _serviceRepo ??= ServiceRepository(dio ?? Dio());
    return _serviceRepo!;
  }

  static ShopRepository get shop {
    _shopRepo ??= ShopRepository(dio ?? Dio());
    return _shopRepo!;
  }
}
