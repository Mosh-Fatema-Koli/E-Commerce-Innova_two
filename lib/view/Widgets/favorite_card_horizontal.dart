import 'package:e_commerce/view/Widgets/favourite_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../utils/color.dart';
import '../../utils/styles.dart';

class FavoriteCardHorizontal extends StatelessWidget {
  FavoriteCardHorizontal({super.key,required this.onTap});
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
                    child: Image.network("https://images.unsplash.com/photo-1505740420928-5e560c06d30e?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8cHJvZHVjdHxlbnwwfHwwfHx8MA%3D%3D&w=1000&q=80",height:double.infinity,width:104.h ,fit: BoxFit.fill,),
                  ),

                  Expanded(child:Padding(
                    padding:  EdgeInsets.symmetric(horizontal:12.w),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("LIME",style: CustomTextStyle.h3(color: AppColors.greyColor),maxLines: 1,overflow: TextOverflow.ellipsis,),
                            Icon(Icons.close,size:16.w,color: AppColors.greyColor,)
                          ],
                        ),
                         SizedBox(height: 4.h,),
                        Text("Shirt",style: CustomTextStyle.h2(fontWeight: FontWeight.w600),maxLines: 1,overflow: TextOverflow.ellipsis,),
                        SizedBox(height: 4.h,),
                        Row(
                          children: [
                            Expanded(
                              flex:3,
                              child: RichText(text:TextSpan(
                                text: "Color:",
                                style:CustomTextStyle.h5(color: AppColors.greyColor),
                                children: [
                                  TextSpan(
                                    text: "Blue",
                                    style:CustomTextStyle.h5(fontWeight: FontWeight.w500),

                                  )
                                ]
                              )),
                            ) ,


                            Expanded(
                              flex: 4,
                              child: RichText(text:TextSpan(
                                text: "Color:",
                                style:CustomTextStyle.h5(color: AppColors.greyColor),
                                children: [
                                  TextSpan(
                                    text: "Blue",
                                    style:CustomTextStyle.h5(fontWeight: FontWeight.w500),

                                  )
                                ]
                              )),
                            )
                          ],
                        ),
                        SizedBox(height: 8.h,),
                        Row(
                          children: [
                            Expanded(
                              flex: 3,
                              child: Text("50\$",style: CustomTextStyle.h4(fontWeight: FontWeight.w500),),
                            ),

                            Expanded(
                                flex: 4,
                                child:Row(
                              children: [   RatingBar(
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
                            )),

                          ],
                        ),


                      ],
                    ),
                  ))
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child:_cartButton((){

              }),)
          ],
        ),
      ),
    );
  }

  _cartButton(Function() onTap){
    return  InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(5.h),
        decoration: BoxDecoration(
          color: AppColors.primary,
          boxShadow: [
            BoxShadow(
                blurRadius: 4,
                spreadRadius: 0,
                offset: const Offset(0, 4),
                color: AppColors.shadowColor
            )
          ],
          borderRadius: BorderRadius.all(Radius.circular(25.r)),
        ),
        height:  36.h,
        width:  36.h,
        child:  SvgPicture.asset("assets/icons/favourites/fav_cart.svg",
            height:15.h,width:15.h,fit: BoxFit.fill,)

      ),
    );
  }
}
