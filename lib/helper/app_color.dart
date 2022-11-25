import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class AppColor {
  static Color appWhite = const Color(0xffFFFFFF);
  static Color appWhiteDark = const Color(0xffF4F4F4);
  static Color appBlack = const Color(0xff000000);
  static Color textFieldBackground = const Color(0xffE9EEF0);
  static Color textFieldBackgroundDark = const Color(0xff232323);
  static Color textGrey = const Color(0xff75808A);
  static Color textGrey2 = const Color(0xff787F89);
  static Color textGreyDark2 = const Color(0xff787F89);
  static Color textGreyDark3 = const Color(0xff8C8C8E);
  static Color appBlue = const Color(0xff0CABDF);
  static Color appBackground = const Color(0xffF7F7F7);
  static Color appBackgroundDark = const Color(0xff000000).withOpacity(0.8);
  static Color cardBackgroundDark = const Color(0xff161618);
  static Color checkGreen = const Color(0xff2AA952);
  static Color red1 = const Color(0xffDB3022);
}

ValueNotifier<bool> isDarkMode = ValueNotifier(false);
