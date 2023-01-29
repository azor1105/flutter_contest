import 'package:flutter/material.dart';
import 'package:flutter_contest/presentation/utils/assets.dart';
import 'package:flutter_contest/presentation/utils/constants/color_const.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CardItem extends StatelessWidget {
  const CardItem({
    super.key,
    required this.cardHolderName,
    required this.expireDate,
    required this.cardNumber,
    required this.cardName,
    required this.cardType,
    required this.gradient,
    this.onEditTap,
    this.onDeleteTap,
    this.buttonsVisible = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 24.w, vertical: 10.h),
      height: 200.h,
      width: double.infinity,
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.5.r),
              gradient: LinearGradient(
                colors: gradient,
                begin: Alignment.bottomRight,
                end: Alignment.topLeft,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: 33.h, left: 34.w, right: 26.w, bottom: 28.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                        child: Text(
                            cardName.isNotEmpty ? cardName : "Karta nomi",
                            style: TextStyle(
                                fontSize: 16.sp, color: ColorConst.white),
                            maxLines: 1)),
                    cardType.isEmpty
                        ? const SizedBox()
                        : cardType == "UzCard"
                            ? Image.asset(Assets.uzcard, width: 40.w)
                            : Image.asset(Assets.humo, width: 40.w),
                  ],
                ),
                const Spacer(),
                Text(
                  cardNumber.isNotEmpty ? cardNumber : "Karta raqami",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25.sp,
                    color: ColorConst.white,
                  ),
                ),
                const Spacer(),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Karta egasining ismi',
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 9.sp,
                            color: ColorConst.white,
                          ),
                        ),
                        SizedBox(height: 9.h),
                        SizedBox(
                          width: 85.w,
                          child: Text(
                            cardHolderName,
                            maxLines: 2,
                            style: TextStyle(
                              fontSize: 15.sp,
                              color: ColorConst.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 52.5.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Amal qilish muddati',
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 9.sp,
                            color: ColorConst.white,
                          ),
                        ),
                        SizedBox(height: 9.h),
                        Text(
                          expireDate,
                          style: TextStyle(
                            fontSize: 15.sp,
                            color: ColorConst.white,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                  ],
                )
              ],
            ),
          ),
          Visibility(
            visible: buttonsVisible,
            child: Positioned(
                bottom: 12,
                right: 10,
                child: Row(
                  children: [
                    IconButton(
                      onPressed: onEditTap,
                      icon: const Icon(Icons.edit, color: Colors.white),
                    ),
                    IconButton(
                      onPressed: onDeleteTap,
                      icon: const Icon(Icons.delete, color: Colors.white),
                    ),
                  ],
                ),
            ),
          )
        ],
      ),
    );
  }

  final String cardHolderName;
  final String expireDate;
  final String cardNumber;
  final String cardName;
  final String cardType;
  final List<Color> gradient;
  final VoidCallback? onEditTap;
  final VoidCallback? onDeleteTap;
  final bool buttonsVisible;
}
