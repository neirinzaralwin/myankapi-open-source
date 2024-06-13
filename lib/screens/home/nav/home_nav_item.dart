import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:myankapi/constants/app_color.dart';
import 'package:myankapi/constants/app_font.dart';
import 'package:myankapi/data/nav/model/home_nav_model.dart';

// ignore: must_be_immutable
class HomeNavigationItem extends StatelessWidget {
  final StatefulNavigationShell navigationShell;
  final HomeNavModel model;
  // int? branchIndex;
  const HomeNavigationItem({
    super.key,
    required this.model,
    required this.navigationShell,
    // this.branchIndex
  });

  @override
  Widget build(BuildContext context) {
    int branchIndex = model.branchIndex ?? 0;

    return InkWell(
      onTap: () => navigationShell.goBranch(branchIndex,
          initialLocation: navigationShell.currentIndex == branchIndex),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(
            kIsWeb ? 20 : 10, 10, kIsWeb ? 20 : 10, 10),
        child: Column(
          children: [
            Icon(model.icon, color: AppColor.primaryColor),
            Text(model.title).primaryColor,
          ],
        ),
      ),
    );
  }
}
