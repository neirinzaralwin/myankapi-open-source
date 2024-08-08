import 'package:flutter/material.dart';
import 'package:myankapi/constants/app_pages.dart';

class BackButtonWidget extends StatelessWidget {
  const BackButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
        onPressed: () {
          AppPages.router.pop();
        },
        icon: const Icon(Icons.arrow_back_rounded),
        label: const Text('Back'));
  }
}
