import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_contest/presentation/utils/constants/color_const.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyTextField extends StatelessWidget {
  MyTextField({
    Key? key,
    required this.controller,
    required this.text,
    this.onChanged,
    this.validator,
    this.suffixIcon,
    this.textInputType,
    this.inputFormatters,
    this.isDone = false,
  }) : super(key: key);

  final Widget? suffixIcon;
  final TextInputType? textInputType;
  final List<TextInputFormatter>? inputFormatters;
  final TextEditingController controller;
  final FormFieldValidator<String?>? validator;
  final String text;
  final ValueChanged<String>? onChanged;
  bool? isDone;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 5.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 5.w),
            child: Text(
              text,
              style: TextStyle(fontWeight: FontWeight.bold, color: ColorConst.primaryColor, fontSize: 16.sp),
            ),
          ),
          const SizedBox(height: 10),
          Material(
            borderRadius: BorderRadius.circular(30),
            shadowColor: Colors.blue.withOpacity(0.12),
            elevation: 25,
            child: TextFormField(
              inputFormatters: inputFormatters,
              keyboardType: textInputType,
              textInputAction: TextInputAction.next,
              onChanged: onChanged,
              style: TextStyle(color: ColorConst.black, fontWeight: FontWeight.bold, fontSize: 16.sp),
              obscureText: (text == "Password" || text == "Confirmation password" ? true : false),
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: validator,
              controller: controller,
              decoration: InputDecoration(
                hintText: text,
                contentPadding: const EdgeInsets.only(left: 20),
                hintStyle: TextStyle(
                  color: ColorConst.neutral7,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                ),
                suffixIcon: suffixIcon,
                filled: true,
                fillColor: Colors.white,
                border: const OutlineInputBorder(),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  borderSide: BorderSide(color: ColorConst.neutral8),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  borderSide:
                      BorderSide(color: ColorConst.primaryColor, width: 2),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(100)),
                  borderSide: BorderSide(color: ColorConst.error),
                ),
                errorBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(100)),
                  borderSide: BorderSide(color: ColorConst.error),
                ),
              ),
              cursorColor: ColorConst.primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
