import 'package:flutter/material.dart';
import 'package:sputnik_test/statics/colors.dart';

class LibraryStyles {
  static TextStyle poppins({
    Color color = LibraryColors.mainGreyColor,
    double fontSize = 17,
    FontWeight fontWeight = FontWeight.normal,
    double letterSpacing = -0.41,
    TextDecoration? decoration,
    double height = 33 / 22,
  }) =>
      TextStyle(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
        letterSpacing: letterSpacing,
        decoration: decoration,
        height: height,
      );
}
