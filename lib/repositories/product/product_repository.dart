import 'package:myankapi/constants/constant_api_routes.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
part 'product_repository.g.dart';

@RestApi()
abstract class ProductRepository {
  factory ProductRepository(Dio dio, {String? baseUrl}) = _ProductRepository;

  @POST(ConstApiRoutes.getProducts)
  Future<dynamic> getProducts();
}
