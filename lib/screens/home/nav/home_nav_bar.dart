import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:myankapi/constants/app_const.dart';
import 'package:myankapi/constants/app_font.dart';
import 'package:myankapi/constants/routes.dart';
import 'package:myankapi/data/nav/model/home_nav_model.dart';

import 'home_nav_item.dart';

class HomeNavBar extends StatefulWidget {
  final StatefulNavigationShell navigationShell;
  const HomeNavBar({super.key, required this.navigationShell});

  @override
  State<HomeNavBar> createState() => _HomeNavBarState();
}

class _HomeNavBarState extends State<HomeNavBar> {
  List<Widget> items = [];

  @override
  void initState() {
    addItemsToList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
          height: 65.0,
          color: Colors.grey[200],
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding:
                    const EdgeInsets.only(left: 20.0, right: 50.0, bottom: 5.0),
                child:
                    const Text(AppConst.APP_NAME).bold.headMedium.primaryColor,
              ),
              // Flexible(
              //   child: (kIsWeb)
              //       ? ListView(
              //           scrollDirection: Axis.horizontal, children: items)
              //       : Row(
              //           mainAxisAlignment: MainAxisAlignment.spaceAround,
              //           children: items)
              // )
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Icon(
                  CupertinoIcons.profile_circled,
                  size: 30.0,
                ),
              ),
            ],
          )),
    );
  }

  addItemsToList() {
    items = [
      HomeNavigationItem(
        navigationShell: widget.navigationShell,
        model: const HomeNavModel(
            title: "Home",
            route: Routes.home,
            icon: Icons.home,
            branchIndex: 0),
      ),
    ];
  }
}
