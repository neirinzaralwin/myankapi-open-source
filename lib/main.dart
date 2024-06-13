import 'package:flutter/material.dart';
import 'package:myankapi/constants/app_const.dart';
import 'package:myankapi/constants/app_theme.dart';
import 'configs/app_configs.dart';
import 'constants/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await appConfig(isProduction: false);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: appThemeData,
      supportedLocales: const [
        Locale('en', 'US'),
      ],
      title: AppConst.APP_NAME,
      debugShowCheckedModeBanner: false,
      routerConfig: AppPages.router,
    );
  }
}
