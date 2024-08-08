import 'package:flutter/material.dart';
import 'package:myankapi/constants/app_font.dart';

class ShopFeedScreen extends StatefulWidget {
  const ShopFeedScreen({super.key});

  @override
  State<ShopFeedScreen> createState() => _ShopFeedScreenState();
}

class _ShopFeedScreenState extends State<ShopFeedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [const Text("Shop Name").bodyLarge.bold.primaryColor],
          ),
        ),
      ],
    ));
  }
}
