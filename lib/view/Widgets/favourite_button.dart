import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../utils/color.dart';
import '../../utils/styles.dart';

class FavouriteButton extends StatelessWidget {
  final bool favourite;
  final Function()? onTap;
  final double? size;
  final double? iconSize;

   const FavouriteButton(
      {super.key, this.size, this.iconSize,required this.favourite, this.onTap});

  @override
  Widget build(BuildContext context) {
    var _theme = Theme.of(context);
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.white,
          boxShadow: [
          BoxShadow(
                  blurRadius: 4,
                  spreadRadius: 0,
                  offset: const Offset(0, 4),
                  color: AppColors.shadowColor
                )
          ],
          borderRadius: const BorderRadius.all(Radius.circular(25)),
        ),
        height: size ?? 50.h,
        width: size ?? 50.h,
        child: favourite
            ? Icon(Icons.favorite,
            size: iconSize ?? 20.h, color: _theme.disabledColor)
            : Icon(Icons.favorite_border,
            size: iconSize ?? 20.h, color: _theme.disabledColor),
      ),
    );
  }


}
