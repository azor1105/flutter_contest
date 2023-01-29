import 'package:flutter/material.dart';
import 'package:flutter_contest/presentation/utils/constants/color_const.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CountryDetailScreen extends StatefulWidget {
  const CountryDetailScreen({Key? key}) : super(key: key);

  @override
  State<CountryDetailScreen> createState() => _CountryDetailScreenState();
}

class _CountryDetailScreenState extends State<CountryDetailScreen> {
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
                    "🇦🇩",
                    style: TextStyle(fontSize: 70.sp),
                  ),
                  SizedBox(width: 20.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Andorra", style: TextStyle(fontSize: 25.sp)),
                      const Text("Andorra la Vella"),
                    ],
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
                      Text("AD")
                    ],
                  ),
                  Column(
                    children: [
                      Text("Continent", style: TextStyle(fontSize: 20.sp)),
                      Text("EU/Europe")
                    ],
                  ),
                  Column(
                    children: [
                      Text("Currency", style: TextStyle(fontSize: 20.sp)),
                      Text("EUR")
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
