import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextStyle {
  static TextStyle h1(
      {Color? color, FontWeight? fontWeight, double? letterSpacing}) {
    return TextStyle(
        color: color,
        fontSize: 34.sp,
        fontFamily: "Metropolis",
        letterSpacing: letterSpacing,
        fontWeight: fontWeight ?? FontWeight.w400);
  }

  static TextStyle h2(
      {Color? color, FontWeight? fontWeight, double? letterSpacing}) {
    return TextStyle(
        color: color,
        fontFamily: "Metropolis",
        fontSize: 18.sp,
        letterSpacing: letterSpacing,
        fontWeight: fontWeight ?? FontWeight.w400);
  }

  static TextStyle h3(
      {Color? color,
      FontWeight? fontWeight,
      double? letterSpacing,
      TextDecoration? decoration}) {
    return TextStyle(
        color: color,
        fontSize: 16.sp,
        letterSpacing: letterSpacing,
        decoration: decoration,
        fontFamily: "Metropolis",
        fontWeight: fontWeight ?? FontWeight.w400);
  }

  static TextStyle h4(
      {Color? color,
      FontWeight? fontWeight,
      double? letterSpacing,
      double? height,
      TextDecoration? decoration}) {
    return TextStyle(
        fontSize: 14.sp,
        color: color,
        height: height,
        decoration: decoration,
        fontFamily: "Metropolis",
        letterSpacing: letterSpacing,
        fontWeight: fontWeight ?? FontWeight.w400);
  }

  static TextStyle h5(
      {Color? color,
      FontWeight? fontWeight,
      double? letterSpacing,
      double? height}) {
    return TextStyle(
        fontSize: 11.sp,
        color: color,
        height: height,
        letterSpacing: letterSpacing,
        fontFamily: "Metropolis",
        fontWeight: fontWeight ?? FontWeight.w400);
  }

  static TextStyle h6(
      {Color? color,
      FontWeight? fontWeight,
      double? letterSpacing,
      double? height}) {
    return TextStyle(
        fontSize: 10.sp,
        color: color,
        height: height,
        letterSpacing: letterSpacing,
        fontWeight: fontWeight ?? FontWeight.w400);
  }

  static TextStyle customSize(
      {Color? color,
      required double size,
      String? family,
      double? letterSpacing,
      double? height,
      FontWeight? fontWeight}) {
    return TextStyle(
        fontWeight: fontWeight ?? FontWeight.w400,
        color: color,
        fontSize: size,
        height: height,
        letterSpacing: letterSpacing,
        fontFamily: family ?? "Metropolis");
  }
}
