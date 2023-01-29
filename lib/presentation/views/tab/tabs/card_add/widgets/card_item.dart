import 'package:flutter/material.dart';
import 'package:flutter_contest/presentation/utils/constants/color_const.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'card_input_component.dart';

class CardItem extends StatelessWidget {
  const CardItem(
      {super.key,
      required this.cardHolderName,
      required this.expireDate,
      required this.cardNumber});

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
              gradient: const LinearGradient(
                colors: ColorConst.otherGradient1,
                begin: Alignment.bottomRight,
                end: Alignment.topLeft,
              ),
            ),
          ),
          // Positioned(
          //   child: SvgPicture.asset(CardIcons.cardVector1),
          // ),
          // Positioned(
          //   left: 15.w,
          //   child: SvgPicture.asset(CardIcons.cardVector2),
          // ),
          // Align(
          //   alignment: Alignment.bottomLeft,
          //   child: SvgPicture.asset(CardIcons.cardVector3),
          // ),
          Padding(
            padding: EdgeInsets.only(
                top: 33.h, left: 34.w, right: 26.w, bottom: 28.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Shaxsiy',
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: ColorConst.white,
                  ),
                ),
                const Spacer(),
                CardInputComponent(
                  cardText: (cardText) {
                    cardNumber.call(cardText);
                  },
                  initialValue: '',
                ),
                const Spacer(),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Card Holder name',
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
                          'Expiry date',
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
        ],
      ),
    );
  }

  final String cardHolderName;
  final String expireDate;
  final ValueChanged<String> cardNumber;
}
