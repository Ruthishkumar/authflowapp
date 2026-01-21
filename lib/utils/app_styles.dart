import 'package:auth_flow_app/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppStyles {
  static final AppStyles _singleton = AppStyles._internal();

  AppStyles._internal();

  static AppStyles get instance => _singleton;

  TextStyle? welcomeTextStyles(
      {required double fontSize, required FontWeight fontWeight}) {
    return GoogleFonts.ubuntu(
        fontStyle: FontStyle.normal,
        fontWeight: fontWeight,
        fontSize: fontSize,
        color: AppColors.blackTextColor);
  }

  TextStyle? loginTextStyle(
      {required double fontSize, required FontWeight fontWeight}) {
    return GoogleFonts.ubuntu(
        fontStyle: FontStyle.normal,
        fontWeight: fontWeight,
        fontSize: fontSize,
        color: AppColors.loginTextColor);
  }

  TextStyle? buttonTextStyles(
      {required double fontSize, required FontWeight fontWeight}) {
    return GoogleFonts.ubuntu(
        fontStyle: FontStyle.normal,
        fontWeight: fontWeight,
        fontSize: fontSize,
        color: AppColors.whiteTextColor);
  }

  TextStyle? greyTextStyles(
      {required double fontSize, required FontWeight fontWeight}) {
    return GoogleFonts.ubuntu(
        fontStyle: FontStyle.normal,
        fontWeight: fontWeight,
        fontSize: fontSize,
        color: AppColors.greyTextColor);
  }

  TextStyle? greenTextStyles(
      {required double fontSize, required FontWeight fontWeight}) {
    return GoogleFonts.ubuntu(
        fontStyle: FontStyle.normal,
        fontWeight: fontWeight,
        fontSize: fontSize,
        color: AppColors.buttonBackgroundColor);
  }

  TextStyle? greenTextStylesWithUnderLine(
      {required double fontSize, required FontWeight fontWeight}) {
    return GoogleFonts.ubuntu(
        decoration: TextDecoration.underline,
        decorationColor: AppColors.buttonBackgroundColor,
        decorationStyle: TextDecorationStyle.solid,
        decorationThickness: 1,
        fontStyle: FontStyle.normal,
        fontWeight: fontWeight,
        fontSize: fontSize,
        color: AppColors.buttonBackgroundColor);
  }
}
