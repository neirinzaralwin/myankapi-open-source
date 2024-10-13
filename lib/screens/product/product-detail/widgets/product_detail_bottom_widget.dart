import 'package:flutter/material.dart';
import 'package:myankapi/constants/app_color.dart';
import 'package:myankapi/constants/app_font.dart';

enum Size {
  pop,
  miniPop,
  normal,
}

class ProductDetailBottomWidget extends StatelessWidget {
  const ProductDetailBottomWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 450.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Exotic").lightGrey.bodyLarge,
          const SelectableText(
            "Product Name",
            style: TextStyle(fontSize: 26, color: AppColor.black, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 15.0),
          _buildSizeWidget(),
          _buildDescriptionWidget(),
          _buildPriceWidget(),
        ],
      ),
    );
  }

  Widget _buildSizeWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Size").greyColor.bodyLarge.bold,
        const SizedBox(height: 5.0),
        SegmentedButton(
          segments: [
            ButtonSegment(value: Size.pop, label: const Text("Pop").bodyMedium.greyColor),
            ButtonSegment(value: Size.miniPop, label: const Text("Mini-pop").bodyMedium.greyColor),
            ButtonSegment(value: Size.normal, label: const Text("Normal").bodyMedium.greyColor),
          ],
          selected: const <Size>{Size.pop},
          onSelectionChanged: (Set<Size> newSelection) {
            // Handle selection change
          },
        ),
      ],
    );
  }

  Widget _buildDescriptionWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 15.0),
        const Text("Description").greyColor.bodyLarge.bold,
        const SizedBox(height: 5.0),
        const SelectableText(
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. "
          "Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. "
          "Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. "
          "Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. "
          "Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
          style: TextStyle(fontSize: 14, color: AppColor.darkGray),
        ),
      ],
    );
  }

  Widget _buildPriceWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 15.0),
        const Text("Price").greyColor.bodyLarge.bold,
        const SizedBox(height: 5.0),
        const Text("100฿").bold.headLarge,
        const SizedBox(height: 8.0),
        Row(
          children: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.remove)),
            SizedBox(
              width: 50,
              child: Center(
                child: const Text("1").bodyMedium,
              ),
            ),
            IconButton(onPressed: () {}, icon: const Icon(Icons.add)),
          ],
        ),
        const SizedBox(height: 8.0),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColor.primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
          onPressed: () {},
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Add to cart").bodyMedium.white,
              ],
            ),
          ),
        ),
      ],
    );
  }
}
