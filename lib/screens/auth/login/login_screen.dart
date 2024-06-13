import 'package:flutter/material.dart';
import 'package:myankapi/constants/app_pages.dart';
import 'package:myankapi/constants/routes.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
        centerTitle: true,
      ),
      body: Center(
        child: OutlinedButton(
            onPressed: () {
              AppPages.router.goNamed(Routes.home);
            },
            child: const Text("Login")),
      ),
    );
  }
}
