import 'package:e_commerce/utils/color.dart';
import 'package:e_commerce/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Themes{

static  ThemeData themeData(BuildContext context)=>ThemeData(
    scaffoldBackgroundColor: AppColors.bgColor,
    primaryColor: AppColors.primary,
//  secondaryHeaderColor: Color(0xFF009f67),
    fontFamily: "Metropolis",
    disabledColor:AppColors.greyColor,
    hintColor: AppColors.greyColor,
    cardColor: AppColors.white,
    iconTheme: IconThemeData(
        color: AppColors.blackColor
    ),
    textTheme: Theme.of(context).textTheme.apply(
      bodyColor: AppColors.blackColor,
      // displayColor: Colors.blue,
    ),
  appBarTheme: AppBarTheme(
    backgroundColor: AppColors.bgColor,
    iconTheme: IconThemeData(color: AppColors.blackColor,size:24.sp,),
    titleTextStyle: CustomTextStyle.h2(color: AppColors.blackColor),

    elevation: 0,
  )


);




}