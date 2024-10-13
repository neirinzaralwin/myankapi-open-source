import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:myankapi/constants/app_color.dart';
import 'package:myankapi/constants/app_pages.dart';
import 'package:myankapi/constants/routes.dart';
import 'package:myankapi/screens/home/nav/home_nav_bar.dart';
import 'package:myankapi/screens/product/product_screen.dart';
import 'package:myankapi/utils/screen_dimension.dart';

class HomeLayout extends StatefulWidget {
  final StatefulNavigationShell navigationShell;
  final List<Widget> children;
  const HomeLayout({
    super.key,
    required this.navigationShell,
    required this.children,
  });

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  bool isSearching = false;
  bool get isHomeRoute {
    bool result = AppPages.router.routerDelegate.currentConfiguration.uri.path == "/${Routes.home}";
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        setState(() {
          isSearching = false;
        });
      },
      child: Scaffold(
        body: CustomScrollView(
          scrollBehavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
          physics: const NeverScrollableScrollPhysics(),
          slivers: [
            SliverAppBar(
              elevation: 0.0,
              scrolledUnderElevation: 0.0,
              pinned: true,
              backgroundColor: Colors.grey[200],
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(10.0),
                child: HomeNavBar(
                    navigationShell: widget.navigationShell,
                    onChanged: (e) {},
                    onSearchingChanged: (val) {
                      setState(() {
                        isSearching = val;
                      });
                    }),
              ),
            ),
            SliverFillRemaining(
              child: Stack(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: isHomeRoute
                            ? ScreenDimension.getWidth(context)
                            : ScreenDimension.getWidth(context, width: 1000),
                        child: BranchContainer(
                          key: ValueKey<int>(widget.navigationShell.currentIndex),
                          currentIndex: widget.navigationShell.currentIndex,
                          children: widget.children,
                        ),
                      ),
                      if (MediaQuery.of(context).size.width > 1000 && isHomeRoute)
                        Flexible(
                            child: Container(
                                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                                width: 400.0,
                                child: const ProductScreen()))
                    ],
                  ),
                  AnimatedSwitcher(
                    duration: const Duration(milliseconds: 500),
                    transitionBuilder: (Widget child, Animation<double> animation) {
                      return FadeTransition(opacity: animation, child: child);
                    },
                    child: (isSearching)
                        ? const Scaffold(
                            body: Center(
                              child: CircularProgressIndicator.adaptive(
                                backgroundColor: AppColor.primaryColor,
                              ),
                            ),
                          )
                        : const SizedBox.shrink(),
                  )
                ],
              ),
            ),
          ],
        ),
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
