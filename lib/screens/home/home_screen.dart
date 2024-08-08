import 'package:flutter/material.dart';
import 'package:myankapi/constants/app_color.dart';
import 'package:myankapi/constants/app_font.dart';
import 'package:myankapi/screens/home/widgets/home_category_widget.dart';
import 'package:myankapi/screens/home/widgets/home_service_widget.dart';

import 'widgets/home_product/home_product_grid_view.dart';
import 'widgets/home_shop_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static double homePadding = 20.0;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.scaffoldBackgroundColor,
      body: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(
            child: Column(
              children: [
                SizedBox(height: 10.0),
                HomeShopWidget(),
                SizedBox(height: 10.0),
                HomeCategoryWidget(),
                SizedBox(height: 20.0),
                HomeServiceWidget(),
                SizedBox(height: 15.0)
              ],
            ),
          ),
          // dot widget
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 20.0,
              child: Center(
                child: Icon(
                  Icons.circle,
                  size: 5.0,
                  color: AppColor.grey,
                ),
              ),
            ),
          ),
          // sliver grid view
          SliverToBoxAdapter(
              child: Padding(
            padding: EdgeInsets.symmetric(horizontal: HomeScreen.homePadding),
            child: const Text("Feed").bold.headLarge.greyColor,
          )),
          const HomeProductGridView(),
        ],
      ),
    );
  }
}
