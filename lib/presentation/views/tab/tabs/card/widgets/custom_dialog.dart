import 'package:flutter/material.dart';
import 'package:flutter_contest/presentation/utils/constants/color_const.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void showDeleteDialog(BuildContext context,
    {required VoidCallback onDeleteTap}) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Colors.white,
        title: const Text(
          "Haqiqatan o'chirmoqchimisiz?",
          textAlign: TextAlign.center,
        ),
        actions: [
          SizedBox(
            height: 30.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      backgroundColor: ColorConst.primaryColor),
                  child: Text(
                    "Yo'q",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.sp,
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      backgroundColor: ColorConst.primaryColor),
                  onPressed: onDeleteTap,
                  child: Text(
                    "Ha",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.sp,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      );
    },
  );
}
