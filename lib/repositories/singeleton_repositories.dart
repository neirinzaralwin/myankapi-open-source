import 'package:dio/dio.dart';
import 'auth/auth_repository.dart';
import 'product/product_repository.dart';

class SingletonRepo {
  static Dio? dio;
  static AuthRepository? _authRepo;
  static ProductRepository? _productRepo;

  static AuthRepository get authInstance {
    _authRepo ??= AuthRepository(dio ?? Dio());
    return _authRepo!;
  }

  static ProductRepository get productInstance {
    _productRepo ??= ProductRepository(dio ?? Dio());
    return _productRepo!;
  }
}
