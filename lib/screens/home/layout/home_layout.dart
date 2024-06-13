import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:myankapi/constants/app_pages.dart';
import 'package:myankapi/constants/routes.dart';
import 'package:myankapi/screens/home/nav/home_nav_bar.dart';

class HomeLayout extends StatelessWidget {
  final StatefulNavigationShell navigationShell;
  final List<Widget> children;
  const HomeLayout({
    super.key,
    required this.navigationShell,
    required this.children,
  });

  bool get isHomeRoute {
    bool result =
        AppPages.router.routerDelegate.currentConfiguration.uri.path ==
            "/${Routes.home}";
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        scrollBehavior:
            ScrollConfiguration.of(context).copyWith(scrollbars: false),
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
            child: BranchContainer(
              key: ValueKey<int>(navigationShell.currentIndex),
              currentIndex: navigationShell.currentIndex,
              children: children,
            ),
          ),
        ],
      ),
    );
  }
}

class BranchContainer extends StatelessWidget {
  const BranchContainer(
      {super.key, required this.currentIndex, required this.children});
  final int currentIndex;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return children[currentIndex];
  }
}
