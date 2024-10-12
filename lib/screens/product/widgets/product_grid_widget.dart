import 'package:flutter/material.dart';
import 'package:myankapi/constants/app_color.dart';
import 'package:myankapi/constants/app_font.dart';
import 'package:myankapi/screens/home/home_screen.dart';

class ProductGridWidget extends StatefulWidget {
  const ProductGridWidget({super.key});

  @override
  State<ProductGridWidget> createState() => _ProductGridWidgetState();
}

class _ProductGridWidgetState extends State<ProductGridWidget> {
  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.8,
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 10.0,
      ),
      delegate: SliverChildBuilderDelegate(
        childCount: 6,
        (BuildContext context, int index) {
          return Container(
            margin: (index % 2 == 0)
                ? EdgeInsets.only(left: HomeScreen.homePadding)
                : EdgeInsets.only(right: HomeScreen.homePadding),
            decoration: BoxDecoration(
              color: AppColor.veryMildGreen,
              border: Border.fromBorderSide(
                  BorderSide(color: AppColor.secondaryColor.withOpacity(0.2))),
              borderRadius: const BorderRadius.all(Radius.circular(15.0)),
            ),
            child: Column(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image.network(
                        height: 150.0,
                        'https://upload.wikimedia.org/wikipedia/commons/2/23/Marijuana-Cannabis-Weed-Bud-Gram.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Row(),
                      Text('Product Title $index',
                              maxLines: 1, overflow: TextOverflow.fade, softWrap: false)
                          .bodyMedium
                          .bold,
                      Text('\$${(index + 1) * 10} Baht').bodySmall.greyColor,
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
