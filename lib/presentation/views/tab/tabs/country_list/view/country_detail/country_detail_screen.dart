import 'package:flutter/material.dart';
import 'package:flutter_contest/data/models/countries/countries_model.dart';
import 'package:flutter_contest/presentation/utils/constants/color_const.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CountryDetailScreen extends StatelessWidget {
  const CountryDetailScreen({
    Key? key,
    required this.countriesModel,
  }) : super(key: key);

  final CountriesModel countriesModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConst.white,
      appBar: AppBar(title: const Text("Country Detail")),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 15.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    countriesModel.emoji,
                    style: TextStyle(fontSize: 70.sp),
                  ),
                  SizedBox(width: 20.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          countriesModel.name,
                          style: TextStyle(fontSize: 25.sp),
                        ),
                        Text(countriesModel.capital),
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(height: 50.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text("Code", style: TextStyle(fontSize: 20.sp)),
                      Text(countriesModel.countryCode)
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        "Continent",
                        style: TextStyle(fontSize: 20.sp),
                      ),
                      Text(
                        "${countriesModel.continent.code}/${countriesModel.continent.name}",
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Text("Currency", style: TextStyle(fontSize: 20.sp)),
                      Text(countriesModel.currency)
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
