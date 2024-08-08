import 'package:myankapi/constants/app_const.dart';

class ConstApiRoutes {
  static const String login = '/auth/login';
  static const String register = '/auth/register';

  // services
  static const String services = '/api/${AppConst.API_VERSION}/services';

  // shops
  static const String shops = '/api/${AppConst.API_VERSION}/shops';
}
