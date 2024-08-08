import 'package:flutter/material.dart';
import 'package:myankapi/constants/app_color.dart';
import 'package:myankapi/constants/app_font.dart';
import 'package:myankapi/constants/app_pages.dart';
import 'package:myankapi/constants/routes.dart';
import 'package:myankapi/data/shop/entity/get_all_shop_entity.dart';
import 'package:myankapi/screens/home/home_screen.dart';

class HomeShopCard extends StatelessWidget {
  final int index;
  final ShopEntity? shop;

  const HomeShopCard({
    required this.index,
    this.shop,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // bool isLoading = shop == null;

    return Container(
      margin: EdgeInsets.only(
          right: 10.0, left: index == 0 ? HomeScreen.homePadding : 0.0),
      decoration: BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(color: AppColor.mildGreen),
      ),
      child: InkWell(
        onTap: () {
          AppPages.router.goNamed(Routes.shopFeed);
        },
        child: Container(
          width: 150.0,
          padding: const EdgeInsets.all(5.0),
          child: Column(
            children: [
              Container(
                height: 140.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  image: DecorationImage(
                    image: NetworkImage(shop?.image ?? ""),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 5.0),
              SizedBox(
                width: 140.0,
                child: Text(shop?.name ?? "",
                        maxLines: 1, overflow: TextOverflow.ellipsis)
                    .bodyMedium,
              ),
              SizedBox(
                width: 140.0,
                child: getShopText(shop?.category.name ?? ""),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Text getShopText(String text) {
    if (text.isEmpty) {
      return const Text(
        "No category",
      ).bodySmall.lightGrey;
    } else {
      return Text(text).bodySmall.secondaryColor;
    }
  }
}
