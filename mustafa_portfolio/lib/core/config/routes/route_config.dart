import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mustafa_portfolio/modules/home/views/home_wrapper.dart';

/// Global navigator key to be used by [GoRouter].
final _globalNavigatorKey = GlobalKey<NavigatorState>();

/// add a global context
final globalContext = _globalNavigatorKey.currentState!.context;

/// Global router navigation to be used by [GoRouter].
final routerNavigation = GoRouter.of(_globalNavigatorKey.currentContext!);

/// Routes configuration for [GoRouter].
class RouteConfig {
  /// [GoRouter] instance.
  static final GoRouter router = GoRouter(
    navigatorKey: _globalNavigatorKey,
    debugLogDiagnostics: true,
    routerNeglect: true,
    initialLocation: '/',
    routes: <GoRoute>[
      GoRoute(
        path: '/',
        builder: (context, state) => const HomeWrapper(),
      ),
      // GoRoute(
      //   path: '/about',
      //   pageBuilder: (context, state) => const AboutView(),
      // ),
      // GoRoute(
      //   path: '/contact',
      //   pageBuilder: (context, state) => const ContactView(),
      // ),
    ],
  );
}
