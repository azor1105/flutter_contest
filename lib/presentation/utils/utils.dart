import 'package:flutter/material.dart';
import 'package:flutter_contest/presentation/utils/constants/color_const.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utils {
  static getMyToast({required String message}) => Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM_RIGHT,
        timeInSecForIosWeb: 1,
        backgroundColor: ColorConst.primaryColor,
        textColor: Colors.white,
        fontSize: 16.sp,
      );

  // static getLoader() => Center(
  //       child: SpinKitCubeGrid(
  //         size: 70.h,
  //         duration: const Duration(milliseconds: 700),
  //         color: ColorConst.primaryColor,
  //       ),
  //     );

  static void fieldFocusChange(
      BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  static String capitalize(String word) {
    return "${word[0].toUpperCase()}${word.substring(1).toLowerCase()}";
  }

  static showSnackBar(BuildContext context, String? text) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          text ?? "",
          style: TextStyle(
              fontSize: 16.sp,
              color: Colors.white,
              fontWeight: FontWeight.w500),
        ),
        backgroundColor: ColorConst.primaryColor,
      ),
    );
  }

  static showLoader() {
    return const Center(
      child: CircularProgressIndicator.adaptive(),
    );
  }

  static showProgress({required BuildContext context}) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Center(child: CircularProgressIndicator.adaptive());
      },
    );
  }
}
