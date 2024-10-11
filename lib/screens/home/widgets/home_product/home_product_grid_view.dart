import 'package:flutter/material.dart';
import 'package:myankapi/screens/home/home_screen.dart';
import 'package:myankapi/screens/home/widgets/home_product/home_post_widget.dart';
import 'package:myankapi/utils/screen_dimension.dart';

class HomeProductGridView extends StatefulWidget {
  const HomeProductGridView({super.key});

  @override
  State<HomeProductGridView> createState() => _HomeProductGridViewState();
}

class _HomeProductGridViewState extends State<HomeProductGridView> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = ScreenDimension.getWidth(context);
    double imageWidth = screenWidth - (HomeScreen.homePadding * 2);

    return SliverList(
      delegate: SliverChildListDelegate([
        HomePostWidget(imageWidth: imageWidth),
      ]),
    );
  }
}
