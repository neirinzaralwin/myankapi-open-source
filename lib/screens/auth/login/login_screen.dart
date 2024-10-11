import 'package:flutter/material.dart';
import 'package:myankapi/constants/app_color.dart';
import 'package:myankapi/constants/app_font.dart';
import 'package:myankapi/constants/app_pages.dart';
import 'package:myankapi/constants/routes.dart';
import 'package:myankapi/screens/widgets/textfield/custom_textfield.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Row(),
            const Text("Login").title.bold.white,
            const SizedBox(height: 50.0),
            Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: const Text(
                    "Enter your phone number to continue",
                    maxLines: 2,
                    softWrap: true,
                    overflow: TextOverflow.fade,
                  ).bodyMedium.white,
                )),
            const SizedBox(height: 10.0),
            CustomTextFormField(
                text: "Your phone number",
                enableBorder: false,
                fillColor: AppColor.white,
                hint: "(+66) xxxxxxxxxxxxx",
                controller: phoneController,
                prefixIcon: Icons.phone,
                validator: null),
            const SizedBox(height: 50.0),
            TextButton(
                style: TextButton.styleFrom(backgroundColor: AppColor.white),
                onPressed: () {
                  AppPages.router.goNamed(Routes.home);
                },
                child: Container(
                  width: 150,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 25.0, vertical: 10),
                  child: Row(
                    children: [
                      const Text("Continue").bodyMedium.primaryColor,
                      const SizedBox(width: 5.0),
                      const Icon(Icons.arrow_forward,
                          color: AppColor.primaryColor)
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
