

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/color.dart';

class SocialMediaButton extends StatelessWidget {
  SocialMediaButton({
    super.key,
    required this.icon,
    required this.onTap

  });
  String icon;
  Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 52.h,
        width: 52.h,
        padding: EdgeInsets.all(11.h),
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.primary.withOpacity(0.02),
            border: Border.all(
              color: AppColors.primary.withOpacity(0.2),

            )
        ),
        child:Image.asset(icon,fit: BoxFit.fill,),
      ),
    );
  }
}
