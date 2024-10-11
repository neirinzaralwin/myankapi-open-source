import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:myankapi/constants/app_color.dart';
import 'package:myankapi/constants/app_const.dart';
import 'package:myankapi/constants/app_font.dart';
import 'package:myankapi/constants/app_pages.dart';
import 'package:myankapi/constants/routes.dart';
import 'package:myankapi/utils/screen_dimension.dart';
import 'login/login_screen.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    bool isTabletView = ScreenDimension.isTabletView(context);

    return Scaffold(
      body: Row(
        children: [
          Flexible(
            flex: 6,
            child: Scaffold(
              appBar: !isTabletView
                  ? null
                  : AppBar(
                      elevation: 0.0,
                      backgroundColor:
                          isTabletView ? AppColor.scaffoldBackgroundColor : Colors.transparent,
                      actions: <Widget>[
                        TextButton(
                            style: TextButton.styleFrom(backgroundColor: AppColor.veryMildGreen),
                            onPressed: () {
                              AppPages.router.goNamed(Routes.home);
                            },
                            child: const Text("Register").bodyMedium.primaryColor),
                        const SizedBox(width: 10.0),
                        TextButton(
                            style: TextButton.styleFrom(backgroundColor: AppColor.veryMildGreen),
                            onPressed: () {
                              AppPages.router.goNamed(Routes.home);
                            },
                            child: const Text("Sign in").bodyMedium.primaryColor),
                        const SizedBox(width: 10.0),
                      ],
                    ),
              body: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Row(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Hello !',
                          style: TextStyle(fontSize: 40),
                        ).bold.greyColor,
                        const Text('Welcome to ${AppConst.APP_NAME}').headMedium.greyColor,
                      ],
                    ),
                  ),
                  const SizedBox(height: 50.0),
                  Container(
                    constraints: const BoxConstraints(
                      maxWidth: 500.0,
                    ),
                    child: SvgPicture.asset(
                      'assets/images/welcome.svg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (!isTabletView)
            const Flexible(
              flex: 4,
              child: LoginScreen(),
            ),
        ],
      ),
    );
  }
}
