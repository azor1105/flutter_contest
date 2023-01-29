import 'package:flutter/material.dart';
import 'package:flutter_contest/presentation/utils/constants/color_const.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GradientItem extends StatelessWidget {
  const GradientItem({
    Key? key,
    required this.onTap,
    required this.gradient,
    required this.isSelected,
  }) : super(key: key);

  final VoidCallback onTap;
  final List<Color> gradient;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50.w,
        width: 50.w,
        margin: EdgeInsets.only(right: 8.w),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            colors: gradient,
          ),
        ),
        child: Visibility(
          visible: isSelected,
          child: const Center(
            child: Icon(
              Icons.done,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
