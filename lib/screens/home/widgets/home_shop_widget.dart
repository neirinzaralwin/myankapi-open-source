import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myankapi/constants/app_color.dart';
import 'package:myankapi/constants/app_font.dart';
import 'package:myankapi/controllers/shop/shop_cubit.dart';
import 'package:myankapi/screens/home/home_screen.dart';
import 'package:shimmer/shimmer.dart';

import 'home_shop/home_shop_card.dart';

class HomeShopWidget extends StatefulWidget {
  const HomeShopWidget({super.key});

  static final shopCubit = ShopCubit();

  @override
  State<HomeShopWidget> createState() => _HomeShopWidgetState();
}

class _HomeShopWidgetState extends State<HomeShopWidget> {
  @override
  void initState() {
    HomeShopWidget.shopCubit.getAllShops();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeShopWidget.shopCubit,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: HomeScreen.homePadding),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Popular shops").bold.headLarge.greyColor,
                TextButton(onPressed: () {}, child: const Text("View more"))
              ],
            ),
          ),
          const SizedBox(height: 10.0),
          BlocBuilder<ShopCubit, ShopState>(builder: (context, state) {
            if (state is ShopLoading) {
              return SizedBox(
                height: 200.0,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Shimmer.fromColors(
                        baseColor: Colors.grey[200]!,
                        highlightColor: AppColor.white,
                        child: HomeShopCard(index: index));
                  },
                ),
              );
            }
            if (state is ShopSuccess) {
              return SizedBox(
                height: 200.0,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: state.shops.length,
                  itemBuilder: (context, index) {
                    return HomeShopCard(index: index, shop: state.shops[index]);
                  },
                ),
              );
            }
            if (state is ShopFailure) {
              return SizedBox(
                height: 200.0,
                child: Center(
                  child: Text(state.message).bodyMedium.redColor,
                ),
              );
            }

            return const SizedBox();
          }),
        ],
      ),
    );
  }
}
