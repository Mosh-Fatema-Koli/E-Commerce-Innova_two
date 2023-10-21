

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../utils/color.dart';
import '../../utils/styles.dart';
import 'favourite_button.dart';

class ProductCardHorizontal extends StatelessWidget {
   ProductCardHorizontal({
    super.key,
    this.onTap
  });
    Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        height: 114.h,
        width: double.infinity,
        child: Stack(
          children: [
            Container(
              height: 104.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                  color: AppColors.white,
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 25,
                        spreadRadius: 0,
                        offset: const Offset(0, 1),
                        color: AppColors.shadowColor
                    )
                  ]
              ),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(8.r),bottomLeft: Radius.circular(8.r)),
                    child: Image.asset("assets/thumbs/category/blouse.png",height:double.infinity,width:104.h ,fit: BoxFit.fill,),
                  ),
                  SizedBox(width:12.w,),
                  Expanded(child:Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Blouse",style: CustomTextStyle.h3(),maxLines: 1,overflow: TextOverflow.ellipsis,),
                      SizedBox(height: 4.h,),
                      Text("Dorothy Perkins",style: CustomTextStyle.h5(color: AppColors.greyColor),maxLines: 1,overflow: TextOverflow.ellipsis,),
                      SizedBox(height: 8.h,),
                      Row(
                        children: [
                          RatingBar(
                            initialRating: 3,
                            direction: Axis.horizontal,
                            allowHalfRating: false,
                            ignoreGestures: true,
                            itemCount: 5,
                            itemSize: 10.h,
                            ratingWidget: RatingWidget(
                              full: SvgPicture.asset(
                                "assets/icons/products/star_fav.svg",
                                fit: BoxFit.fill,
                              ),
                              empty: SvgPicture.asset(
                                  "assets/icons/products/star.svg",
                                  fit: BoxFit.fill),
                              half: const SizedBox(),
                            ),
                            itemPadding:
                            EdgeInsets.symmetric(horizontal: 2.w),
                            onRatingUpdate: (rating) {
                              print(rating);
                            },
                          ),
                          Text(
                            "(10)",
                            style: CustomTextStyle.h6(
                                color: Theme.of(context).disabledColor),
                          )
                        ],
                      ),
                      SizedBox(height: 8.h,),
                      Text("50\$",style: CustomTextStyle.h4(fontWeight: FontWeight.w500),),

                    ],
                  ))
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: FavouriteButton(
                favourite: false,
                size: 36.h,
              ),)
          ],
        ),
      ),
    );
  }
}