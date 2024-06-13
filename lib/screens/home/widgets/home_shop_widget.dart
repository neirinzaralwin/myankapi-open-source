import 'package:flutter/material.dart';
import 'package:myankapi/constants/app_color.dart';
import 'package:myankapi/constants/app_font.dart';
import 'package:myankapi/screens/home/home_screen.dart';

class HomeShopWidget extends StatefulWidget {
  const HomeShopWidget({super.key});

  @override
  State<HomeShopWidget> createState() => _HomeShopWidgetState();
}

class _HomeShopWidgetState extends State<HomeShopWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
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
        SizedBox(
          height: 200.0,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 5,
            itemBuilder: (context, index) {
              return Container(
                width: 150.0,
                padding: const EdgeInsets.all(5),
                margin: EdgeInsets.only(
                    right: 10.0,
                    left: index == 0 ? HomeScreen.homePadding : 0.0),
                decoration: BoxDecoration(
                  color: AppColor.white,
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(color: AppColor.mildGreen),
                ),
                child: Column(
                  children: [
                    Container(
                      height: 140.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        image: const DecorationImage(
                          image: NetworkImage(
                              "https://articles.connectnigeria.com/wp-content/uploads/2021/09/branding-1.jpg"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(height: 5.0),
                    SizedBox(
                      width: 140.0,
                      child: const Text("Shop name",
                              maxLines: 1, overflow: TextOverflow.ellipsis)
                          .bodyMedium,
                    ),
                    SizedBox(
                      width: 140.0,
                      child: const Text("Shop name",
                              maxLines: 1, overflow: TextOverflow.ellipsis)
                          .secondaryColor,
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
