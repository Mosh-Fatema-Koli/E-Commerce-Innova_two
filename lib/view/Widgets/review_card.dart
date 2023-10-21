import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/color.dart';
import '../../utils/styles.dart';
import 'custom_rating_bar.dart';

class ReviewCard extends StatelessWidget {
   ReviewCard({
    super.key,
    this.isImage=false
  });
  bool isImage;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding:
          EdgeInsets.symmetric(vertical: 24.h, horizontal: 16.w),
          child: Container(
            padding:
            EdgeInsets.symmetric(horizontal: 24.h, vertical: 24.h),
            decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(8.r),
                boxShadow: [
                  BoxShadow(
                      spreadRadius: 0,
                      blurRadius: 25,
                      offset: const Offset(0, 1),
                      color: AppColors.shadowColor)
                ]),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Helene Moore",
                  style:
                  CustomTextStyle.h4(fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: 8.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomRatingBar(initialRating: 3),
                    Text(
                      "june 5, 2019",
                      style: CustomTextStyle.h5(
                          color: AppColors.greyColor),
                    )
                  ],
                ),
                SizedBox(
                  height: 11.h,
                ),
                Text(
                  "The dress is great! Very classy and comfortable. It fit perfectly! I'm 5'7\" and 130 pounds. I am a 34B chest. This dress would be too long for those who are shorter but could be hemmed. I wouldn't recommend it for those big chested as I am smaller chested and it fit me perfectly. The underarms were not too wide and the dress was made well.",
                  style: CustomTextStyle.h4(height: 1.5,letterSpacing:-0.15),
                ),
                SizedBox(height:10.h,),
                if(isImage)
                    SizedBox(
                  height:104.h,
                  child: ListView.separated(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder:(context,index){
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(4.r),
                      child: Image.asset("assets/thumbs/category/clothes.png",height:140.h,width:104.h,fit: BoxFit.fill,),
                    );
                  }, separatorBuilder:(context,index){
                    return SizedBox(width:13.w,);
                  }, itemCount: 3),
                ),


                SizedBox(height:10.h,),





                Row(

                  children: [
                    const Spacer(),
                    Text(
                      "Helpful",
                      style: CustomTextStyle.h5(
                          color: AppColors.greyColor),
                    ),
                    SizedBox(width:10.w,),
                    Icon(
                      Icons.thumb_up,
                      color: AppColors.greyColor,
                      size: 24.sp,
                    )
                  ],
                )
              ],
            ),
          ),
        ),
        Positioned(
            child: Container(
              height: 36.h,
              width: 36.h,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: AssetImage("assets/profile/user-profile.jpeg"),
                      fit: BoxFit.fill)),
            )),
      ],
    );
  }
}