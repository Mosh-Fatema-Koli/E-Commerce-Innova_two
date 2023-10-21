import 'package:e_commerce/utils/app_text.dart';
import 'package:e_commerce/utils/color.dart';
import 'package:e_commerce/utils/dimensions.dart';
import 'package:e_commerce/utils/styles.dart';
import 'package:e_commerce/view/Screen/CartScreen/screen/sucessfull_screen.dart';
import 'package:e_commerce/view/Widgets/custom_back_button.dart';
import 'package:e_commerce/view/Widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'address_screen.dart';

class CheckOutScreen extends StatelessWidget {
  CheckOutScreen({super.key});
  List paymentList = ["BiKash", "Nagat", "Rocket"];

  var selectPayment="".obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const CustomBackButton(),
        elevation: 5,
        title: Text(AppText.checkout),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: Dimensions.sidePadding.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 25.h,
            ),
            // <------------------ Shipping address ------------>
            Text(
              AppText.shippingAddress,
              style: CustomTextStyle.h2(fontWeight: FontWeight.w700),
            ),
            SizedBox(
              height: 15.h,
            ),

            Container(
              padding: EdgeInsets.symmetric(horizontal: 28.w, vertical: 18.h),
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
                children: [
                  Row(
                    children: [
                      Expanded(
                          child: Text(
                        "Jame Doe",
                        style: CustomTextStyle.h4(fontWeight: FontWeight.w500),
                      )),
                      GestureDetector(
                        onTap:(){
                          Get.to(AddressScreen());
                        },
                        child: Text(
                          AppText.change,
                          style: CustomTextStyle.h4(color: AppColors.primary),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 7.h,
                  ),
                  Text(
                    "3 Newbridge Court Chino Hills, CA 91709, United States",
                    style:
                        CustomTextStyle.h4(height: 1.5, letterSpacing: -0.15),
                  ),
                ],
              ),
            ),

            // <------------------ Payment  ------------>
            SizedBox(
              height: 30.h,
            ),
            Text(
              AppText.payment,
              style: CustomTextStyle.h2(fontWeight: FontWeight.w700),
            ),
            SizedBox(
              height: 10.h,
            ),

            Wrap(
              children: paymentList.map((e) => Obx(()=>
                 GestureDetector(
                   onTap: (){
                     selectPayment.value=e;
                   },
                   child: Container(
                    height: 36.h,
                    padding: EdgeInsets.all(10.h),
                    margin: EdgeInsets.only(right:10.w),
                    decoration: BoxDecoration(
                      color:selectPayment.value==e?AppColors.primary :AppColors.white,
                      borderRadius: BorderRadius.circular(4.r),

                      border: Border.all(
                        width: 1,
                        color:selectPayment.value==e?AppColors.primary:AppColors.greyColor,
                      )
                    ),
                    child: Text(e,style:CustomTextStyle.h4(fontWeight: FontWeight.w500,color:selectPayment.value==e?AppColors.white:AppColors.blackColor),),
                ),
                 ),
              )).toList(),

            ),
            SizedBox(
              height:20.h,
            ),
            Text(
              "Details",
              style: CustomTextStyle.h2(fontWeight: FontWeight.w700),
            ),
            SizedBox(
              height:10.h,
            ),
            _listTile(title:AppText.order,amount:150),
            SizedBox(height:10.h,),
            _listTile(title:AppText.delivery,amount:150),
            SizedBox(height:10.h,),
            _listTile(title:AppText.summary,amount:150),
            SizedBox(height:10.h,),
            CustomButton(title:AppText.submitOrder, onPressed:(){

              Get.off(const SuccessfulScreen());

            })




          ],
        ),
      ),
    );
  }

   _listTile({required String title,required double amount}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("$title:",style: CustomTextStyle.h3(fontWeight: FontWeight.w500,color:AppColors.greyColor),),
              Text("$amount\$",style: CustomTextStyle.h2(fontWeight: FontWeight.bold,),),

            ],
          );
  }
}
