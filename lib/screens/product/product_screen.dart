import 'package:flutter/material.dart';
import 'package:myankapi/constants/app_color.dart';
import 'package:myankapi/screens/product/widgets/product_header.dart';
import 'widgets/product_grid_widget.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColor.scaffoldBackgroundColor,
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: SizedBox(height: 15.0),
          ),
          ProductHeader(),
          ProductGridWidget(),
          SliverToBoxAdapter(
            child: SizedBox(height: 20.0),
          ),
        ],
      ),
    );
  }
}
