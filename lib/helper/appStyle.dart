import 'package:flutter/material.dart';

class AppStyle {
  static TextStyle notaTitle(
      {double fontSize = 16.0,
        color = Colors.black,
        fontWeight = FontWeight.w600,
        fontStyle = FontStyle.normal}) {
    return TextStyle(
        fontSize: fontSize,
        fontFamily: 'Notasans',
        color: color,
        fontWeight: fontWeight,
        fontStyle: fontStyle);
  }

  static TextStyle notaSubText(
      {
        color = Colors.black,
        double letterSpace = 0.0,
        fontWeight = FontWeight.w400,
        fontStyle = FontStyle.normal,
        fontSize = 14.0 }) {
    return TextStyle(
        fontSize: fontSize,
        letterSpacing: letterSpace,
        fontFamily: 'Notasans',
        color: color,
        fontStyle: fontStyle);
  }
  static TextStyle heeboTitle(
      {double fontSize = 16.0,
        color = Colors.black,
        fontWeight = FontWeight.w600,
        fontStyle = FontStyle.normal}) {
    return TextStyle(
        fontSize: fontSize,
        fontFamily: 'Heebo',
        color: color,
        fontWeight: fontWeight,
        fontStyle: fontStyle);
  }
}