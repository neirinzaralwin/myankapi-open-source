import 'package:flutter/material.dart';
import 'package:myankapi/screens/home/home_screen.dart';
import 'package:myankapi/screens/home/widgets/home_product/home_post_widget.dart';

class HomeProductGridView extends StatefulWidget {
  const HomeProductGridView({super.key});

  @override
  State<HomeProductGridView> createState() => _HomeProductGridViewState();
}

class _HomeProductGridViewState extends State<HomeProductGridView> {
  // final gridDelegate = const SliverGridDelegateWithFixedCrossAxisCount(
  //   crossAxisCount: 1,
  //   childAspectRatio: 0.88,
  // );

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final imageWidth = screenWidth - (HomeScreen.homePadding * 2);

    // sliver list
    return SliverList(
      delegate: SliverChildListDelegate([
        HomePostWidget(imageWidth: imageWidth),
      ]),
    );
  }
}
