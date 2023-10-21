


import 'package:e_commerce/view/Widgets/sized_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../utils/color.dart';
import '../../utils/styles.dart';
import 'custom_rating_bar.dart';
import 'favourite_button.dart';

class ProductCard extends StatelessWidget {
   ProductCard({
    super.key,
     this.onTap
  });
  Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onTap,
      child: SizedBox(
        //   color: Colors.black,
        height: 276.h,
        width: 148.w,
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10.r),
                  child: Image.asset(
                    "assets/thumbs/dress/dress2.png",
                    height: 184.h,
                    width: 148.w,
                    fit: BoxFit.fill,
                  ),
                ),
                SizedBox(
                  height: 8.h,
                ),
                Row(
                  children: [
                    CustomRatingBar(initialRating: 3,totalRating:10,),

                  ],
                ),
                SizedBox(
                  height: 6.h,
                ),
                Text(
                  "Dorothy",
                  style: CustomTextStyle.h5(
                      color: Theme.of(context).disabledColor),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                SizedBox(
                  height: 6.h,
                ),
                Text(
                  "Evening Dress",
                  style: CustomTextStyle.h3(),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                SizedBox(
                  height: 6.h,
                ),
                Row(
                  children: [
                    Text(
                      "15\$",
                      style: CustomTextStyle.h3(
                          fontWeight: FontWeight.w600,
                          color: AppColors.greyColor,
                          decoration: TextDecoration.lineThrough),
                    ),
                    SizedBox(
                      width: 4.w,
                    ),
                    Text("12\$",
                        style: CustomTextStyle.h3(
                            fontWeight: FontWeight.w600,
                            color: AppColors.primary))
                  ],
                ),
              ],
            ),
            Positioned(
              top: 166.h,
              right: 0,
              child: FavouriteButton(
                favourite: false,
                size: 36.h,
                onTap: (){
                  Get.bottomSheet(

                      SizedBottomSheet(onChanged:(value){

                  }),
                    isScrollControlled: true

                  );

                },
              ),

              // )
            ),
            Positioned(
                top: 8.h,
                left: 9.w,
                child: Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: 7.w, vertical: 6.h),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(29.r),
                    color: AppColors.blackColor,
                  ),
                  child: Text(
                    "New",
                    style: CustomTextStyle.h5(
                        color: AppColors.white),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}

