import 'package:flutter/material.dart';
import 'package:myankapi/constants/app_color.dart';
import 'package:myankapi/constants/app_font.dart';
import 'package:myankapi/screens/home/home_screen.dart';

import 'multi_photo_view.dart';

class HomePostWidget extends StatelessWidget {
  final double imageWidth;
  const HomePostWidget({super.key, required this.imageWidth});

  @override
  Widget build(BuildContext context) {
    const double cardPadding = 10.0;

    return Container(
      padding: const EdgeInsets.all(cardPadding),
      margin: EdgeInsets.symmetric(horizontal: HomeScreen.homePadding, vertical: 10.0),
      decoration: const BoxDecoration(
        color: AppColor.veryMildGreen,
        border: Border.fromBorderSide(BorderSide(color: AppColor.primaryColor)),
        borderRadius: BorderRadius.all(Radius.circular(
          10.0 + cardPadding,
        )),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(8.0, 5.0, 8.0, 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(Icons.circle, size: 8.0, color: AppColor.primaryColor),
                    const SizedBox(width: 5.0),
                    const Text("What's update").headSmall.greyColor,
                  ],
                ),
                TextButton(onPressed: () {}, child: const Text("View all").bodyMedium.primaryColor)
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(5.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0),
              border: Border.all(color: AppColor.mildGreen),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MultiPhotoViewInProudct(
                  imageList: const [
                    "https://images.unsplash.com/photo-1637094481682-bc6acf54b880?q=80&w=3024&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                    "https://images.unsplash.com/photo-1637094481682-bc6acf54b880?q=80&w=3024&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                    "https://images.unsplash.com/photo-1637094481682-bc6acf54b880?q=80&w=3024&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                  ],
                  imageWidth: imageWidth,
                ),
                const SizedBox(height: 5.0),
                Container(
                  padding: const EdgeInsets.all(5.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Product Name").bold.bodyLarge,
                          Container(
                            width: 50.0,
                            padding: const EdgeInsets.symmetric(horizontal: 5.0),
                            child: const Text("2min", textAlign: TextAlign.end).bodySmall.greyColor,
                          )
                        ],
                      ),
                      const Text(
                        "Product description lorem ipsm dolor sit amet lorem ipsm lorm ipsm",
                      ).bodyMedium.greyColor,
                    ],
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 6.0),
          Container(
            padding: const EdgeInsets.all(5.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0),
              border: Border.all(color: AppColor.mildGreen),
            ),
            child: Container(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Second Product Name").bold.bodyLarge,
                      Container(
                        width: 50.0,
                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                        child: const Text("5d", textAlign: TextAlign.end).bodySmall.greyColor,
                      )
                    ],
                  ),
                  const Text(
                    "Product description lorem ipsm dolor sit amet lorem ipsm lorm ipsm",
                  ).bodyMedium.greyColor,
                ],
              ),
            ),
          ),
          const SizedBox(height: 6.0),
          Container(
            padding: const EdgeInsets.all(5.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0),
              border: Border.all(color: AppColor.mildGreen),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MultiPhotoViewInProudct(
                  imageList: const [
                    "https://images.unsplash.com/photo-1637094481682-bc6acf54b880?q=80&w=3024&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                    "https://images.unsplash.com/photo-1637094481682-bc6acf54b880?q=80&w=3024&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                  ],
                  imageWidth: imageWidth,
                ),
                const SizedBox(height: 5.0),
                Container(
                  padding: const EdgeInsets.all(5.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("New product").bold.bodyLarge,
                          Container(
                            width: 50.0,
                            padding: const EdgeInsets.symmetric(horizontal: 5.0),
                            child:
                                const Text("1week", textAlign: TextAlign.end).bodySmall.greyColor,
                          )
                        ],
                      ),
                      const Text(
                        "Product description lorem ipsm dolor sit amet lorem ipsm lorm ipsm",
                      ).bodyMedium.greyColor,
                    ],
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 6.0),
          Container(
            padding: const EdgeInsets.all(5.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0),
              border: Border.all(color: AppColor.mildGreen),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MultiPhotoViewInProudct(
                  imageList: const [
                    "https://images.unsplash.com/photo-1637094481682-bc6acf54b880?q=80&w=3024&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                  ],
                  imageWidth: imageWidth,
                ),
                const SizedBox(height: 5.0),
                Container(
                  padding: const EdgeInsets.all(5.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("New product").bold.bodyLarge,
                          Container(
                            width: 50.0,
                            padding: const EdgeInsets.symmetric(horizontal: 5.0),
                            child:
                                const Text("1week", textAlign: TextAlign.end).bodySmall.greyColor,
                          )
                        ],
                      ),
                      const Text(
                        "Product description lorem ipsm dolor sit amet lorem ipsm lorm ipsm",
                      ).bodyMedium.greyColor,
                    ],
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 3.0),
          TextButton(
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("View more").bodyMedium.primaryColor,
                  const SizedBox(width: 10.0),
                  const Icon(Icons.arrow_right_alt, color: AppColor.primaryColor)
                ],
              ))
        ],
      ),
    );
  }
}
