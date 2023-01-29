import 'package:flutter/material.dart';
import 'package:flutter_contest/presentation/utils/constants/route_names.dart';
import 'package:flutter_contest/presentation/views/splash/splash_screen.dart';
import 'package:flutter_contest/presentation/views/tab/tab_screen.dart';
import 'package:flutter_contest/presentation/views/tab/tabs/country_list/country_detail/country_detail_screen.dart';

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
      case RouteNames.countryDetail:
        return MaterialPageRoute(
          builder: (ctx) => const CountryDetailScreen(),
        );
      default:
        return null;
    }
  }
}
