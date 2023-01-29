import 'package:flutter/material.dart';
import 'package:flutter_contest/presentation/utils/constants/route_names.dart';
import 'package:flutter_contest/presentation/views/splash/splash_screen.dart';
import 'package:flutter_contest/presentation/views/tab/tab_screen.dart';

class AppRouter {
  static Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case RouteNames.splash:
        return MaterialPageRoute(
          builder: (ctx) => const SplashScreen(),
        );
      case RouteNames.tabs:
        return MaterialPageRoute(
          builder: (ctx) => const TabScreen(),
        );
      default:
        return null;
    }
  }
}
