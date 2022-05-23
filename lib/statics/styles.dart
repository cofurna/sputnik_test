import 'package:flutter/material.dart';
import 'package:sputnik_test/statics/colors.dart';

class LibraryStyles {
  static const poppins17Medium = TextStyle(
    fontFamily: 'Poppins',
    color: LibraryColors.mainGreyColor,
    fontSize: 17,
    fontWeight: FontWeight.w500,
    letterSpacing: -0.0041,
    height: 26 / 17,
  );

  static final poppins10Medium = poppins17Medium.copyWith(
    fontSize: 10,
    height: 24 / 10,
  );

  static final poppins10SemiBold = poppins17Medium.copyWith(
    fontSize: 10,
    fontWeight: FontWeight.w600,
    height: 15 / 10,
  );

  static final poppins10Bold = poppins17Medium.copyWith(
    fontSize: 10,
    fontWeight: FontWeight.w700,
    height: 15 / 10,
  );

  static final poppins13Medium = poppins17Medium.copyWith(
    fontSize: 13,
    height: 19.5 / 13,
  );

  static final poppins15Normal = poppins17Medium.copyWith(
    fontSize: 15,
    fontWeight: FontWeight.w400,
    height: 22.5 / 15,
  );
  static final poppins15Medium = poppins17Medium.copyWith(
    fontSize: 15,
    fontWeight: FontWeight.w500,
    height: 19.5 / 15,
  );
  static final poppins17Normal = poppins17Medium.copyWith(
    fontWeight: FontWeight.w400,
  );

  static final poppins17Bold = poppins17Medium.copyWith(
    fontWeight: FontWeight.w700,
  );
  static final poppins20Bold = poppins17Medium.copyWith(
    fontWeight: FontWeight.w700,
    height: 24 / 20,
  );
  static final poppins22Bold = poppins17Medium.copyWith(
    fontSize: 22,
    fontWeight: FontWeight.w700,
    height: 33 / 22,
  );

  static final poppins24Medium = poppins17Medium.copyWith(
    fontSize: 24,
    height: 36 / 24,
  );

  static final poppins34Bold = poppins17Medium.copyWith(
    fontSize: 34,
    fontWeight: FontWeight.w700,
    height: 51 / 34,
  );

  static final poppins36Medium = poppins17Medium.copyWith(
    fontSize: 36,
    height: 58 / 36,
  );

  static final poppins50Bold = poppins17Medium.copyWith(
    fontSize: 50,
    fontWeight: FontWeight.bold,
    height: 0.5,
  );
}
