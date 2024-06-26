import 'package:flutter/material.dart';
import 'package:flutter_contest/app/view/app.dart';
import 'package:flutter_contest/data/models/card_model/card_model.dart';
import 'package:flutter_contest/data/models/countries/countries_model.dart';
import 'package:flutter_contest/presentation/utils/constants/route_names.dart';
import 'package:flutter_contest/presentation/views/offline_country/offline_country_screen.dart';
import 'package:flutter_contest/presentation/views/splash/splash_screen.dart';
import 'package:flutter_contest/presentation/views/tab/tab_screen.dart';
import 'package:flutter_contest/presentation/views/tab/tabs/card/views/card_add/card_add_screen.dart';
import 'package:flutter_contest/presentation/views/tab/tabs/card/views/card_edit/card_edit_screen.dart';
import 'package:flutter_contest/presentation/views/tab/tabs/country_list/view/country_detail/country_detail_screen.dart';

class AppRouter {
  static Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case RouteNames.offlineCountry:
        return MaterialPageRoute(
          builder: (ctx) => const OfflineCountryScreen(),
        );
      case RouteNames.main:
        return MaterialPageRoute(
          builder: (ctx) => const MainScreen(),
        );
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
          builder: (ctx) => CountryDetailScreen(
            countriesModel: routeSettings.arguments as CountriesModel,
          ),
        );
      case RouteNames.cardAdd:
        return MaterialPageRoute(
          builder: (ctx) => const CardAddScreen(),
        );
      case RouteNames.cardEdit:
        return MaterialPageRoute(
          builder: (ctx) => CardEditScreen(
            card: routeSettings.arguments as CardModel,
          ),
        );
      default:
        return null;
    }
  }
}
