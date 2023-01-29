import 'package:flutter/material.dart';
import 'package:flutter_contest/presentation/utils/assets.dart';
import 'package:flutter_contest/presentation/utils/constants/color_const.dart';
import 'package:flutter_contest/presentation/utils/constants/route_names.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<void> _init() async {
    Future.delayed(
      const Duration(seconds: 3),
      () {
        Navigator.pushReplacementNamed(context, RouteNames.tabs);
      },
    );
  }

  @override
  void initState() {
    _init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConst.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: Lottie.asset(
            Assets.splashLottie,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
            repeat: false,
          ),
        ),
      ),
    );
  }
}
