import 'package:flutter/material.dart';
import 'package:flutter_contest/data/services/hive/country_hive/country_hive.dart';
import 'package:flutter_contest/presentation/utils/constants/route_names.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OfflineCountryScreen extends StatelessWidget {
  const OfflineCountryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: const Text("API call and Caching")),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 15.h),
        children: List.generate(
          CountryHiveService.getCountries().values.toList().length, (index) {
            var country = CountryHiveService.getCountries().values.toList()[index];
            return ListTile(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  RouteNames.countryDetail,
                  arguments: country,
                );
              },
              title: Text(country.name),
              subtitle: Text(country.capital),
            );
          },
        ),
      ),
    );
  }
}
