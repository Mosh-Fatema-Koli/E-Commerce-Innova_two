import 'package:e_commerce/utils/dimensions.dart';
import 'package:e_commerce/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


import '../../utils/color.dart';

class CustomButton extends StatelessWidget {
  final double? width;
  final double? height;
  final Function() onPressed;
  final String title;
  IconData? icon;
  final double? iconSize;
  final Color? backgroundColor;
  final Color? textColor;
  final Color? borderColor;
  final Color? iconColor;

  CustomButton({super.key,
    this.width,
    this.height,
    this.iconColor,
    required this.title,
    required this.onPressed,
    this.icon,
    this.backgroundColor,
    this.textColor,
    this.borderColor ,
    this.iconSize ,
  });

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    EdgeInsetsGeometry edgeInsets = const EdgeInsets.all(0);
    if (width == null || height == null) {
      edgeInsets =  EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h);
    }
    return Padding(
      padding: edgeInsets,
      child: InkWell(
        onTap: onPressed,
        child: Container(
          width: width,
          height: height,
          padding: edgeInsets,
          decoration: BoxDecoration(
              color: backgroundColor??AppColors.primary,
              border: Border.all(color: borderColor??AppColors.primary),
              borderRadius: BorderRadius.circular(Dimensions.buttonRadius.r),
              boxShadow: [
                BoxShadow(
                    color:backgroundColor!=null? backgroundColor!.withOpacity(0.3):AppColors.primary.withOpacity(0.3),
                    blurRadius: 4.0,
                    offset: const Offset(0.0, 5.0)),
              ]),
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _buildIcon(theme,iconColor),
                _buildTitle(),
              ],
            ),
          ),
        ),
      ),
    );
    /*MaterialButton(
      onPressed: onPressed,
      shape: new RoundedRectangleBorder(
        borderRadius: new BorderRadius.circular(
          AppSizes.buttonRadius
        )
      ),
      child: Container(
        alignment: Alignment.center,
        width: width,
        height: height,
        child: Text(title,
          style: _theme.textTheme.button?.copyWith(
            backgroundColor: _theme.textTheme.button.backgroundColor,
            color: _theme.textTheme.button.color
          )
        )
      )
    );*/
  }

  Widget _buildTitle() {
    return Text(
      title,
      style:CustomTextStyle.h4(fontWeight: FontWeight.w500,color:textColor??AppColors.white),
    );
  }

  Widget _buildIcon(ThemeData theme ,Color? iconColor) {
    if (icon != null) {
      return Padding(
        padding: const EdgeInsets.only(
          right: 8.0,
        ),
        child: Icon(
          icon,
          size: iconSize,
          color:iconColor??theme.iconTheme.color,
        ),
      );
    }

    return SizedBox();
  }
}
