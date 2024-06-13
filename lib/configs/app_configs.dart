import 'package:myankapi/configs/dio_configs.dart';
import 'package:myankapi/constants/app_const.dart';
import 'package:myankapi/core/storage/app_storage.dart';
import 'package:myankapi/repositories/singeleton_repositories.dart';

import 'shared_preferences_singleton.dart';

Future<void> appConfig({required bool isProduction}) async {
  await SharedPreferencesSingleton.init();
  String basedURL = isProduction ? AppConst.PRODUCTION_URL : AppConst.BASE_URL;
  final dioConfig = DioConfigs(baseUrl: basedURL, token: AppStorage.getToken);
  SingletonRepo.dio = dioConfig.init();
}
