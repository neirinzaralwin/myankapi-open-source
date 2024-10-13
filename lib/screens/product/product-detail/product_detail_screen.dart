import 'package:flutter/material.dart';
import 'package:myankapi/constants/app_color.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({super.key});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        backgroundColor: AppColor.grey,
        body: Center(
          child: Text("Product Detail Screen"),
        ));
  }
}
