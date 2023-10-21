import 'package:e_commerce/utils/app_text.dart';
import 'package:e_commerce/utils/color.dart';
import 'package:e_commerce/utils/styles.dart';
import 'package:e_commerce/view/Screen/FavoriteScreen/favorite_screen.dart';
import 'package:e_commerce/view/Widgets/custom_back_button.dart';
import 'package:e_commerce/view/Widgets/custom_rating_bar.dart';
import 'package:e_commerce/view/Widgets/favourite_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../routes/routes.dart';
import '../../Widgets/custom_button.dart';
import '../../Widgets/product_list.dart';

class ProductDetails extends StatelessWidget {
   ProductDetails({super.key});

  var sizeList=[
    "Xs",
    "S",
    "M",
    "L",
    "Xl"
  ].obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: const CustomBackButton(),
        title: const Text("Evemomg Dress"),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.share_rounded))
        ],
      ),
      body: Column(
        children: [
          Expanded(
              child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                _image(),
                SizedBox(
                  height: 12.h,
                ),
                _sizeAndFavButton(),
                SizedBox(
                  height: 24.h,
                ),
                _productDes(),
                Divider(),
                _listTileButton(title: AppText.ratingAndReviews,onTap: (){
                  Get.toNamed(Routes.reviewAndRatingScreen);
                }),
                Divider(),
                _listTileButton(title: AppText.shippingInfo),
                Divider(),
                _listTileButton(title:AppText.support),
                const Divider(),
                SizedBox(height:15.h,),
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal:16.w,vertical:8.h),
                  child: Row(
                    children: [
                      Expanded(child: Text(AppText.youCanAlsoLikeThis,style: CustomTextStyle.h2(),))
                      ,
                     Text("12 items",style: CustomTextStyle.h5(color:AppColors.greyColor),)
                    ],
                  ),
                ),
                SizedBox(height:12.h,),
                const ProductList(),
                SizedBox(height:15.h,),

              ],
            ),
          )),
          Container(
            height: 112.h,
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.white,
              boxShadow: [
                BoxShadow(
                  color: AppColors.shadowColor,
                  blurRadius: 8,
                  offset: const Offset(0, -4),
                  spreadRadius: 0
                )
              ]
            ),
            padding: EdgeInsets.symmetric(vertical: 20.h, ),
            child: Column(
              children: [
                CustomButton(
                  title:AppText.addToCart,
                  onPressed: () {},
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

   _listTileButton({required title,Function()? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
                  padding:  EdgeInsets.symmetric(horizontal:16.w,vertical:8.h),
                  child: Row(
                    children: [
                      Expanded(child: Text(title,style: CustomTextStyle.h3(),))
                      ,
                      Icon(Icons.arrow_forward_ios_rounded,size: 16.sp,)
                    ],
                  ),
                ),
    );
  }

  _productDes() {
    return Padding(
                padding:  EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      
                      children: [
                        Expanded(child: Text("H&M",style: CustomTextStyle.h1(),maxLines:1,overflow: TextOverflow.ellipsis,)),
                        Text("\$19.99",style: CustomTextStyle.h1(),)
                      ],
                    ),
                    Text("Shart Black dress",style: CustomTextStyle.h5(color: AppColors.greyColor),),
                    SizedBox(height:8.h,),
                   CustomRatingBar(initialRating: 3, totalRating: 15),
                    SizedBox(height:16.h,),
                    Text("Short dress in soft cotton jersey with decorative buttons down the front and a wide, frill-trimmed square neckline with concealed elastication. Elasticated seam under the bust and short puff sleeves with a small frill trim.",style: CustomTextStyle.h4(height:1.5,fontWeight: FontWeight.w500),)
                  ],
                ),
              );
  }

   _sizeAndFavButton() {
    return Padding(
                padding:  EdgeInsets.symmetric(horizontal: 16.w),
                child: Row(
                  children: [
                    _sizedButton(title: "Size",onTap: (){
                      _showBottomSheet();


                    }),
                    SizedBox(width:16.w,),
                    _sizedButton(title:"Size",borderColor: AppColors.greyColor),
                    SizedBox(width:16.w,),
                    FavouriteButton(favourite:false,size: 36.w,)


                  ],
                ),
              );
  }

  void _showBottomSheet() {
    Get.bottomSheet(
      Container(
        height: 352.h,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(topLeft: Radius.circular(34.r),topRight: Radius.circular(34.r))
            ,
            boxShadow: [
              BoxShadow(
                  color: AppColors.shadowColor,
                  blurRadius: 30,
                  spreadRadius: 0,
                  offset: const Offset(0, -4)
              )
            ]

        ),
        child: Column(
          children: [
            SizedBox(height: 14.h,),
            Container(
              height: 6.h,
              width: 60.w,
              decoration: BoxDecoration(
                  borderRadius:BorderRadius.circular(25.r),
                  color: AppColors.greyColor
              ),
            ),
            SizedBox(height: 16.h),
            Text("Select size",style:CustomTextStyle.h2(),),
            SizedBox(height: 22.h),
            Wrap(
                children:sizeList.value.map((e) => GestureDetector(
                  onTap: () {

                  },
                  child:
                      Container(
                        height:40.h,
                        width: 90.w,
                        margin: EdgeInsets.only(right:20.w,bottom: 12.h),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.r),
                            color: AppColors.white,
                            border: Border.all(
                                color:AppColors.greyColor
                            )
                        ),
                        alignment: Alignment.center,
                        child: Text(e,style:CustomTextStyle.h4(fontWeight: FontWeight.w500,color:AppColors.blackColor),),


                      ),

                )).toList(),

            ),




          ],
        ),
      ),
      isScrollControlled: true
    );
  }


   _image() {
    return SizedBox(
                height: 413.h,
                child: ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return Image.asset(
                      "assets/images/products/shortdress.png",
                      height: double.infinity,
                      width: 275.w,
                      fit: BoxFit.fill,
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      width: 4.w,
                    );
                  },
                ),
              );
  }

   _sizedButton({required String title, Color? borderColor,Function()? onTap }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
                        height: 40.h,
                        width: 137.w,
                        decoration: BoxDecoration(
                            border: Border.all(
                              color:borderColor??AppColors.primary,
                            ),
                            borderRadius: BorderRadius.circular(8.r),
                            color: AppColors.white,

                        ),
                        alignment:Alignment.center,
                        padding: EdgeInsets.symmetric(horizontal:12.w,),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(title,style: CustomTextStyle.h4(fontWeight: FontWeight.w500),),
                            Icon(Icons.keyboard_arrow_down,size:20.sp,)
                          ],
                        ),
                      ),
    );
  }
}
