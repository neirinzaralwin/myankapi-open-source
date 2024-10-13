import 'package:flutter/material.dart';
import 'package:myankapi/screens/home/home_screen.dart';

import 'widgets/product_detail_bottom_widget.dart';
import 'widgets/product_detail_top_widget.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({super.key});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: HomeScreen.homePadding),
      child: Padding(
        padding: const EdgeInsets.only(top: 15.0),
        child: Center(
          child: Wrap(
            runSpacing: HomeScreen.homePadding,
            spacing: HomeScreen.homePadding,
            children: const [
              ProductDetailTopWidget(),
              ProductDetailBottomWidget(),
              SizedBox(height: 30.0),
            ],
          ),
        ),
      ),
    ));
  }
}
