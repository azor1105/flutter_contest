import 'package:flutter/material.dart';
import 'package:flutter_contest/presentation/utils/constants/color_const.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CardTypeItem extends StatefulWidget {
  const CardTypeItem({super.key});

  @override
  State<CardTypeItem> createState() => _CardTypeItemState();
}

class _CardTypeItemState extends State<CardTypeItem> {
  TextEditingController controller = TextEditingController();
  String? valueChoose;
  String? text;
  List listItem = ["UzCard", "Xumo"];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 5.h),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Padding(
          padding: EdgeInsets.only(left: 5.w),
          child: Text(
            "Karta turi",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: ColorConst.primaryColor,
                fontSize: 16.sp),
          ),
        ),
        const SizedBox(height: 10),
        Material(
          color: ColorConst.white,
          borderRadius: BorderRadius.circular(30),
          shadowColor: ColorConst.white,
          elevation: 25,
          child: Container(
            decoration: BoxDecoration(
                color: ColorConst.white,
                border: Border.all(width: 0.1, color: ColorConst.neutral6),
                borderRadius: BorderRadius.circular(30)),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: DropdownButton(
                dropdownColor: Colors.white,
                disabledHint: const Text("Not Selected"),
                focusColor: ColorConst.white,
                underline: const SizedBox(),
                isExpanded: true,
                icon: const Icon(Icons.arrow_drop_down,
                    color: ColorConst.neutral5),
                iconSize: 30,
                hint: Text("Karta turi",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: ColorConst.neutral7,
                        fontSize: 16.sp)),
                value: valueChoose,
                onChanged: (v) {
                  setState(() {
                    valueChoose = v as String;
                  });
                },
                items: listItem.map((valueItem) {
                  return DropdownMenuItem(
                    value: valueItem,
                    child: Text(valueItem,
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: ColorConst.neutralBlack,
                            fontSize: 16.sp)),
                  );
                }).toList(),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
