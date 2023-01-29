import 'package:flutter/material.dart';
import 'package:flutter_contest/presentation/utils/assets.dart';
import 'package:flutter_contest/presentation/utils/constants/color_const.dart';
import 'package:flutter_contest/presentation/utils/constants/route_names.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class NoInternetScreen extends StatelessWidget {
  const NoInternetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConst.white,
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: [
            const Spacer(),
            Lottie.asset(Assets.noInternetLottie),
            SizedBox(height: 20.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 60.w),
              child: Text(
                "Please, check internet connection",
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const Spacer(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: SizedBox(
                width: double.infinity,
                height: 50.h,
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: ColorConst.primaryColor,
                  ),
                  onPressed: () => Navigator.pushNamed(
                    context,
                    RouteNames.offlineCountry,
                  ),
                  child: Text(
                    'Offline page',
                    style: TextStyle(
                      color: ColorConst.white,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}
