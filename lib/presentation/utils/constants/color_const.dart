import 'package:flutter/material.dart';
import 'package:flutter_gradient_colors/flutter_gradient_colors.dart';

class ColorConst {
  static final blackWithOpacity087 = ColorConst.black.withOpacity(0.87);

  static Color transparent = Colors.transparent;
  static Color grey300 = Colors.grey.shade300;
  static Color white = Colors.white;
  static Color cF7F7F7 = const Color(0xFFF7F7F7);
  static Color cE5E5E5 = const Color(0xFFE5E5E5);
  static Color black = Colors.black;
  static const Color primaryColor = Colors.blue;
  static const Color neutralBlack = Color(0xFF09101D);
  static const Color neutral1 = Color(0xFF2C3A4B);
  static const Color neutral2 = Color(0xFF394452);
  static const Color neutral3 = Color(0xFF545D69);
  static const Color neutral4 = Color(0xFF6D7580);
  static const Color neutral5 = Color(0xFF858C94);
  static const Color neutral6 = Color(0xFFA5ABB3);
  static const Color neutral7 = Color(0xFFDADEE3);
  static const Color neutral8 = Color(0xFFEBEEF2);
  static const Color error = Color(0xFFDA1414);

  // Others
  static const otherGradient1 = [Color(0xFF2972FE), Color(0xFF6499FF)];
  static const otherGradient2 = [Color(0xFFFFB800), Color(0xFFFFDA7B)];

  static List<List<Color>> myGradients = [
    GradientColors.malibuBeach,
    GradientColors.amyCrisp,
    GradientColors.newLife,
    GradientColors.plumPlate,
    GradientColors.happyFisher,
    GradientColors.nightParty,
    GradientColors.phoenixStart,
    GradientColors.blackGray,
    GradientColors.hiddenJaguar,
    GradientColors.plumBath,
  ];
}
