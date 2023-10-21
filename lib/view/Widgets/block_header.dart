import 'package:e_commerce/utils/color.dart';
import 'package:e_commerce/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/dimensions.dart';

class BlockHeader extends StatelessWidget {
  const BlockHeader(
      {super.key,
      required this.title,
      this.linkText,
      this.onLinkTap,
      this.description});

  final String title;
  final String? linkText;
  final VoidCallback? onLinkTap;
  final String? description;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onLinkTap,
      child: Container(
        padding: EdgeInsets.only(
            top: Dimensions.sidePadding.h, left: Dimensions.sidePadding.w,right:Dimensions.sidePadding.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: CustomTextStyle.h1(fontWeight: FontWeight.w700),
                ),
                linkText != null
                    ? Text(
                        linkText!,
                        style: CustomTextStyle.h5(color: AppColors.blackColor),
                      )
                    : const SizedBox(),
              ],
            ),
            SizedBox(
              height: 4.h,
            ),
            linkText != null
                ? Text(
                    description!,
                    style: CustomTextStyle.h5(color: AppColors.greyColor),
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
