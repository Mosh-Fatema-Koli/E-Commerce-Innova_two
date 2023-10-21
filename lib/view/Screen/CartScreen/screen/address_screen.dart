import 'package:e_commerce/utils/app_text.dart';
import 'package:e_commerce/utils/color.dart';
import 'package:e_commerce/utils/styles.dart';
import 'package:e_commerce/view/Widgets/custom_back_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'add_address.dart';

class AddressScreen extends StatelessWidget {
   AddressScreen({super.key});

  var selectIndex=0.obs;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text(AppText.shippingAddress),
        centerTitle: true,
        leading: const CustomBackButton(),
        elevation: 3,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.blackColor,
        onPressed:(){
          Get.to(AddAddress());
        },
        child: Icon(Icons.add,color: AppColors.white,size:20.sp,),
      ),
      body: ListView.builder(
        itemCount:3,
        padding: EdgeInsets.symmetric(horizontal: 16.w,vertical:12.h),
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: EdgeInsets.symmetric(vertical:12.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r),
              color: AppColors.white,
              boxShadow: [
                BoxShadow(
                  blurRadius:25,
                  spreadRadius:0,
                  color: AppColors.shadowColor,
                  offset: const Offset(0, 1)
                )
              ]
            ),
            padding: EdgeInsets.symmetric(horizontal:16.w,vertical:16.h),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(child: Text("Jane Doe",style: CustomTextStyle.h3(fontWeight: FontWeight.w500),)),
                    Text("Edit",style: CustomTextStyle.h3(fontWeight: FontWeight.w500,color: AppColors.primary),)
                  ],
                ),
                SizedBox(height: 7.h,),
                Text("3 Newbridge Court Chino Hills, CA 91709, United States",style: CustomTextStyle.h4(height:1.5,letterSpacing:-0.15),),
                SizedBox(height: 7.h,),
                Obx(()=>
                   CheckboxListTile(
                     title: Text("Use as the shipping address",style:CustomTextStyle.h4(height:1.5,letterSpacing:-0.15),),
                      checkboxShape:RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4.r),
                        side: BorderSide(
                          color: AppColors.greyColor,
                        ),

                      ) ,
                      controlAffinity: ListTileControlAffinity.leading,
                      activeColor: AppColors.blackColor,
                      value:selectIndex.value==index, onChanged:(value){
                    selectIndex.value=index;
                  }),
                ),




              ],
            ),

          );

        },


      ),
    );
  }
}
