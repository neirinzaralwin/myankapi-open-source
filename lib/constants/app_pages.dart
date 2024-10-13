import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:myankapi/screens/auth/auth_screen.dart';
import 'package:myankapi/screens/home/home_screen.dart';
import 'package:myankapi/screens/home/layout/home_layout.dart';
import 'package:myankapi/screens/product/product-detail/product_detail_screen.dart';
import 'routes.dart';

final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');

class AppPages {
  static final GoRouter router = GoRouter(
    navigatorKey: rootNavigatorKey,
    initialLocation: "/${Routes.auth}",
    debugLogDiagnostics: false,
    routes: <RouteBase>[
      GoRoute(
        name: Routes.auth,
        path: "/${Routes.auth}",
        builder: (context, state) => const AuthScreen(),
      ),
      StatefulShellRoute(
        builder:
            (BuildContext context, GoRouterState state, StatefulNavigationShell navigationShell) {
          return navigationShell;
        },
        navigatorContainerBuilder:
            (BuildContext context, StatefulNavigationShell navigationShell, List<Widget> children) {
          return HomeLayout(navigationShell: navigationShell, children: children);
        },
        branches: <StatefulShellBranch>[
          // Branch 0
          StatefulShellBranch(
            routes: <RouteBase>[
              GoRoute(
                redirect: checkAuthenticated,
                name: Routes.home,
                path: "/${Routes.home}",
                builder: (BuildContext context, GoRouterState state) => const HomeScreen(),
              ),
              GoRoute(
                name: Routes.productDetail,
                path: "/${Routes.productDetail}",
                builder: (BuildContext context, GoRouterState state) => const ProductDetailScreen(),
              ),
            ],
          ),
        ],
      ),
    ],
  );

  static FutureOr<String?> checkAuthenticated(context, state) {
    return null;
  }
}
