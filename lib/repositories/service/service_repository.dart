import 'package:myankapi/constants/constant_api_routes.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
part 'service_repository.g.dart';

@RestApi()
abstract class ServiceRepository {
  factory ServiceRepository(Dio dio, {String? baseUrl}) = _ServiceRepository;

  @GET(ConstApiRoutes.services)
  Future<dynamic> getServices({@Query("show_in_home") bool? showInHome});
}
