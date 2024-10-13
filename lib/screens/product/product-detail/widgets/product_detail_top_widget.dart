import 'package:flutter/material.dart';
import 'package:myankapi/constants/app_color.dart';
import 'package:myankapi/constants/app_font.dart';
import 'package:myankapi/constants/app_pages.dart';
import 'package:myankapi/constants/routes.dart';

class ProductDetailTopWidget extends StatelessWidget {
  const ProductDetailTopWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 450.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextButton(
              onPressed: () => AppPages.router.goNamed(Routes.home),
              child: SizedBox(
                width: 150.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.keyboard_double_arrow_left, color: AppColor.primaryColor),
                    const Text("Back to home").bodyMedium.bold.primaryColor,
                  ],
                ),
              )),
          const SizedBox(height: 10.0),
          Container(
            width: 450.0,
            height: 450.0,
            decoration: const BoxDecoration(
              color: AppColor.scaffoldBackgroundColor,
              image: DecorationImage(
                image: NetworkImage(
                    "https://t4.ftcdn.net/jpg/07/64/01/53/360_F_764015308_Cw80VmHsva3zTeFVoizbZF5Q61KYjj2Z.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
