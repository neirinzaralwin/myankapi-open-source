import 'package:flutter/material.dart';
import 'package:myankapi/constants/app_color.dart';
import 'package:myankapi/constants/app_font.dart';
import 'package:myankapi/screens/home/widgets/home_category_widget.dart';
import 'widgets/home_product/home_product_grid_view.dart';

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
            child: SizedBox(height: 15.0),
          ),
          SliverToBoxAdapter(
              child: Padding(
            padding: EdgeInsets.symmetric(horizontal: HomeScreen.homePadding),
            child: const Text("Feed").bold.headLarge.greyColor,
          )),
          const HomeProductGridView(),
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
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: HomeScreen.homePadding),
                  child: const Text("Category").bold.headLarge.greyColor,
                ),
                const SizedBox(height: 15.0),
                const HomeCategoryWidget(),
                const SizedBox(height: 20.0),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
