import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:myankapi/constants/app_pages.dart';
import 'package:myankapi/constants/routes.dart';
import 'package:myankapi/screens/home/nav/home_nav_bar.dart';
import 'package:myankapi/screens/product/product_screen.dart';
import 'package:myankapi/utils/screen_dimension.dart';

class HomeLayout extends StatelessWidget {
  final StatefulNavigationShell navigationShell;
  final List<Widget> children;
  const HomeLayout({
    super.key,
    required this.navigationShell,
    required this.children,
  });

  bool get isHomeRoute {
    bool result = AppPages.router.routerDelegate.currentConfiguration.uri.path == "/${Routes.home}";
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        scrollBehavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
        physics: const NeverScrollableScrollPhysics(),
        slivers: [
          if (kIsWeb || isHomeRoute)
            SliverAppBar(
              elevation: 0.0,
              scrolledUnderElevation: 0.0,
              pinned: true,
              backgroundColor: Colors.grey[200],
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(10.0),
                child: HomeNavBar(navigationShell: navigationShell),
              ),
            ),
          SliverFillRemaining(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: ScreenDimension.getWidth(context),
                  child: BranchContainer(
                    key: ValueKey<int>(navigationShell.currentIndex),
                    currentIndex: navigationShell.currentIndex,
                    children: children,
                  ),
                ),
                if (MediaQuery.of(context).size.width > 1000)
                  Flexible(
                      child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          width: 400.0,
                          child: const ProductScreen()))
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class BranchContainer extends StatelessWidget {
  const BranchContainer({super.key, required this.currentIndex, required this.children});
  final int currentIndex;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return children[currentIndex];
  }
}
