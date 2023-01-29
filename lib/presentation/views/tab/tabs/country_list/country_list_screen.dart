import 'package:flutter/material.dart';
import 'package:flutter_contest/presentation/utils/constants/route_names.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CountryListScreen extends StatefulWidget {
  const CountryListScreen({Key? key}) : super(key: key);

  @override
  State<CountryListScreen> createState() => _CountryListScreenState();
}

class _CountryListScreenState extends State<CountryListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("API call and Caching")),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 15.h),
        children: List.generate(10, (index) {
          return ListTile(
            onTap: (){
              Navigator.pushNamed(context, RouteNames.countryDetail);
            },
            title: Text("Andorra"),
            subtitle: Text("Andorra la Vella"),
          );
        }),
      ),
    );
  }
}
