import 'package:e_commerce/utils/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/color.dart';


class CustomTextInputField extends StatelessWidget {

  final TextEditingController controller;
  final String hint;
  final FormFieldValidator? validator;
  final TextInputType keyboard;
  final FocusNode? focusNode;
 // final VoidCallback? onFinished;
  final bool isPassword;
  final double horizontalPadding;
  Function(String)? onChanged;
  final String? error;
  final Widget? suffixIcon;

  CustomTextInputField({Key? key,
    required this.controller,
    required this.hint,
    this.validator,
    this.keyboard = TextInputType.text,
    this.focusNode,
   // this.onFinished,
    this.isPassword = false,
    this.horizontalPadding = 16.0,
    this.onChanged,
    this.suffixIcon,
    this.error})
      : super(key: key);


  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
      child: Column(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: AppColors.white,
                borderRadius:
                BorderRadius.circular(Dimensions.textFieldRadius.r),
                boxShadow: [
                  BoxShadow(
                    blurRadius:8,
                    spreadRadius: 0,
                    offset: const Offset(0, 1),
                    color: AppColors.shadowColor
                  )
                ]

            ),
            child: Padding(
              padding: EdgeInsets.only(left: 16.0.w),
              child: TextFormField(
                onChanged: onChanged,
                validator: validator,
                style: TextStyle(
                    color: AppColors.blackColor,
                    fontWeight: FontWeight.normal,
                    fontSize: 16.sp),
                controller: controller,
                focusNode: focusNode,
                keyboardType: keyboard,
                obscureText: isPassword,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    labelText: hint,
                    hintText: hint,
                    suffixIcon:suffixIcon,
                    labelStyle:  TextStyle(
                    color: AppColors.greyColor,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w300),
                    hintStyle: TextStyle(
                        color: AppColors.greyColor,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w300)),
              ),
            ),
          ),

        ],
      ),
    );
  }


}
