

import 'package:e_commerce/routes/routes.dart';
import 'package:e_commerce/utils/app_text.dart';
import 'package:e_commerce/utils/dimensions.dart';
import 'package:e_commerce/utils/styles.dart';
import 'package:e_commerce/view/Widgets/custom_back_button.dart';
import 'package:e_commerce/view/Widgets/custom_button.dart';
import 'package:e_commerce/view/Widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../utils/color.dart';
import '../../Widgets/bottom_menu.dart';
import '../../Widgets/cart_card.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const SizedBox(),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.search,
                size: 20.w,
              ))
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: Dimensions.sidePadding.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 18.h,
            ),
            Text(
              "My Bag",
              style: CustomTextStyle.h1(fontWeight: FontWeight.w700),
            ),
            SizedBox(
              height: 24.h,
            ),
            ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return const CartCard();
                },
                separatorBuilder: (context, index) {
                  return SizedBox(
                    height: 24.h,
                  );
                },
                itemCount: 3),
            SizedBox(
              height: 25.h,
            ),
            Stack(
              children: [
                Container(
                  height: 36.h,
                  margin: EdgeInsets.only(right: 10.w),
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.r),
                      color: AppColors.white,
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 8,
                            spreadRadius: 0,
                            offset: const Offset(0, 1),
                            color: AppColors.shadowColor)
                      ]),
                  child:  TextField(
                    readOnly: true,
                    onTap: (){
                      _promoCodeBottomSheet();

                    },
                    decoration: const InputDecoration(
                        border: InputBorder.none, hintText: "Enter your promo code"),
                  ),
                ),
                Positioned(
                    right: 0,
                    child: Container(
                      height: 36.h,
                      width: 36.h,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.blackColor,
                      ),
                      child: Icon(
                        Icons.arrow_forward,
                        size: 16.h,
                        color: AppColors.white,
                      ),
                    ))
              ],
            ),
            SizedBox(
              height: 24.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Total amount:",
                  style: CustomTextStyle.h4(
                      fontWeight: FontWeight.w500, color: AppColors.greyColor),
                ),
                Text(
                  "124\$",
                  style: CustomTextStyle.h2(
                      fontWeight: FontWeight.w900, color: AppColors.blackColor),
                ),
              ],
            ),
            SizedBox(
              height: 24.h,
            ),

            // <--------------- check out button---------------->

            CustomButton(title: "CHECk OUT", onPressed: () {
              Get.toNamed(Routes.checkOutScreen);
            }),
            SizedBox(
              height: 16.h,
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomMenu(2),
    );
  }

  _promoCodeBottomSheet(){

    return Get.bottomSheet(
        Padding(
          padding:  EdgeInsets.symmetric(horizontal:16.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 14.h,),
              Container(
                height: 6.h,
                width: 60.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3.r),
                  color: AppColors.greyColor
                ),
              ),
              SizedBox(height: 32.h,),

              Stack(
                children: [
                  Container(
                    height: 36.h,
                    margin: EdgeInsets.only(right: 10.w),
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.r),
                        color: AppColors.white,
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 8,
                              spreadRadius: 0,
                              offset: const Offset(0, 1),
                              color: AppColors.shadowColor)
                        ]),
                    child:  const TextField(
                      decoration: InputDecoration(
                          border: InputBorder.none, hintText: "Enter your promo code"),
                    ),
                  ),
                  Positioned(
                      right: 0,
                      child: Container(
                        height: 36.h,
                        width: 36.h,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.blackColor,
                        ),
                        child: Icon(
                          Icons.arrow_forward,
                          size: 16.h,
                          color: AppColors.white,
                        ),
                      ))
                ],
              ),
              SizedBox(height: 32.h,),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Your Promo Codes",style: CustomTextStyle.h2(fontWeight: FontWeight.w600),)),
              SizedBox(height: 18.h,),
              ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context,index){
                    return Container(
                      height: 80.h,
                      padding: EdgeInsets.only(left:14.w,),
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
                      child:Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.only(topLeft:Radius.circular(8.r),bottomLeft: Radius.circular(8.r)),
                            child: Image.asset("assets/images/checkout/cart/promo_bg2.png",height:double.infinity,width:80.h,),
                          ),
                          Expanded(
                              child:Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Personal offer",style: CustomTextStyle.h4(fontWeight:FontWeight.w500),),
                              SizedBox(height:4.h,),
                              Text("mypromocode2020",style: CustomTextStyle.h5(),),


                            ],
                          )),
                          Expanded(
                              child:Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("6 days remaining",style: CustomTextStyle.h5(color:AppColors.greyColor),),
                              SizedBox(height:4.h,),
                              CustomButton(
                                 height:36.h ,
                                 width: 93.w,
                                 title: "Apply",
                                 onPressed: (){
                                 })

                            ],
                          ))

                        ],
                      ),
                    );
                  },
                  separatorBuilder:(context,index){
                    return SizedBox(height: 24.h,);

              }, itemCount: 3)
            ],
          ),
        ),
        isScrollControlled: true,
        backgroundColor:AppColors.white,
        shape:RoundedRectangleBorder(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(25.r),topRight: Radius.circular(25.r)


            )
        )



    );



  }
}
