import 'package:myankapi/constants/constant_api_routes.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
part 'shop_repository.g.dart';

@RestApi()
abstract class ShopRepository {
  factory ShopRepository(Dio dio, {String? baseUrl}) = _ShopRepository;

  @GET(ConstApiRoutes.shops)
  Future<dynamic> getShops();
}
