import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:myankapi/screens/auth/login/login_screen.dart';
import 'package:myankapi/screens/home/home_screen.dart';
import 'package:myankapi/screens/home/layout/home_layout.dart';
import 'package:myankapi/screens/service/visa/e-extension/e_extension_service_screen.dart';
import 'package:myankapi/screens/service/visa/tr-extension/tr_extension_service.screen.dart';

import 'routes.dart';

final GlobalKey<NavigatorState> rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');

class AppPages {
  static final GoRouter router = GoRouter(
    navigatorKey: rootNavigatorKey,
    initialLocation: "/${Routes.login}",
    debugLogDiagnostics: false,
    routes: <RouteBase>[
      GoRoute(
        name: Routes.login,
        path: "/${Routes.login}",
        builder: (context, state) => const LoginScreen(),
      ),
      StatefulShellRoute(
        builder: (BuildContext context, GoRouterState state,
            StatefulNavigationShell navigationShell) {
          return navigationShell;
        },
        navigatorContainerBuilder: (BuildContext context,
            StatefulNavigationShell navigationShell, List<Widget> children) {
          return HomeLayout(
              navigationShell: navigationShell, children: children);
        },
        branches: <StatefulShellBranch>[
          // Branch 0
          StatefulShellBranch(
            routes: <RouteBase>[
              GoRoute(
                redirect: checkAuthenticated,
                name: Routes.home,
                path: "/${Routes.home}",
                builder: (BuildContext context, GoRouterState state) =>
                    const HomeScreen(),
                routes: [
                  GoRoute(
                    redirect: checkAuthenticated,
                    name: Routes.eExtension,
                    path: Routes.eExtension,
                    builder: (BuildContext context, GoRouterState state) =>
                        const EextensionServiceScreen(),
                  ),
                  GoRoute(
                    redirect: checkAuthenticated,
                    name: Routes.trExtension,
                    path: Routes.trExtension,
                    builder: (BuildContext context, GoRouterState state) =>
                        const TrExtensionServiceScreen(),
                  )
                ],
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
