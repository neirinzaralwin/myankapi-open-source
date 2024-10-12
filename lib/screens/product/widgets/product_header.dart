import 'package:flutter/material.dart';
import 'package:myankapi/constants/app_font.dart';
import 'package:myankapi/screens/home/home_screen.dart';

class ProductHeader extends StatefulWidget {
  const ProductHeader({super.key});

  @override
  State<ProductHeader> createState() => _ProductHeaderState();
}

class _ProductHeaderState extends State<ProductHeader> {
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
        child: Padding(
      padding: EdgeInsets.symmetric(horizontal: HomeScreen.homePadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Products").bold.headLarge.greyColor,
                  const SizedBox(height: 5.0),
                  const Text("Find your favorite products").bodySmall.lightGrey,
                  const SizedBox(height: 10.0),
                ],
              ),
              TextButton(onPressed: () {}, child: const Text("View all").bodyMedium.primaryColor)
            ],
          ),
        ],
      ),
    ));
  }
}
