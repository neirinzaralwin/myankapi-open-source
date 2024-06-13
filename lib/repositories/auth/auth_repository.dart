import 'package:myankapi/constants/constant_api_routes.dart';
import 'package:myankapi/data/auth/login/login_req_model.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
part 'auth_repository.g.dart';

@RestApi()
abstract class AuthRepository {
  factory AuthRepository(Dio dio, {String? baseUrl}) = _AuthRepository;

  @POST(ConstApiRoutes.login)
  Future<dynamic> loginAdmin(@Body() LoginReqModel req);
}
