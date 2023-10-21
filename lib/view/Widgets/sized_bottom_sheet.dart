import 'package:e_commerce/view/Widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../utils/color.dart';
import '../../utils/styles.dart';

class SizedBottomSheet extends StatelessWidget {
   SizedBottomSheet({super.key,required this.onChanged});
  var sizeList=[
    "Xs",
    "S",
    "M",
    "L",
    "Xl"
  ].obs;
  var selectSize=''.obs;
   Function(String) onChanged;



  @override
  Widget build(BuildContext context) {
    return
        Container(
         // height: 352.h,
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
            mainAxisSize: MainAxisSize.min,
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
                    selectSize.value=e;
                    onChanged(selectSize.value);
                    Get.back();

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
              SizedBox(height: 22.h),
            const Divider(),
            GestureDetector(
              onTap: (){},
              child: Padding(
                padding:  EdgeInsets.symmetric(horizontal:16.w,vertical:8.h),
                child: Row(
                  children: [
                    Expanded(child: Text("Size info",style: CustomTextStyle.h3(),))
                    ,
                    Icon(Icons.arrow_forward_ios_rounded,size: 16.sp,)
                  ],
                ),
              ),
            ),
              const Divider(),
              SizedBox(height: 22.h),


              CustomButton(title:"ADD TO FAVORITES", onPressed: (){
                Get.back();

              }),
              SizedBox(height: 10.h),







            ],
          ),
        );

  }
}
