
import 'package:e_commerce/utils/app_text.dart';
import 'package:e_commerce/utils/dimensions.dart';
import 'package:e_commerce/utils/styles.dart';
import 'package:e_commerce/view/Screen/ShopScreen/controller/filter_controller.dart';
import 'package:e_commerce/view/Widgets/custom_back_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../utils/color.dart';
import '../../../Widgets/custom_button.dart';

class BrandScreen extends StatelessWidget {
   BrandScreen({super.key});
  final _filterController=Get.put(FilterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const CustomBackButton(),
        title: Text(AppText.brand),
        centerTitle: true,
        elevation:  3,
      ),
      body: Column(
        children: [
          Expanded(
              child: SingleChildScrollView(
                child: Column(
            children: [
                
                SizedBox(
                  height: 21.h,
                ),
                Container(
                  height: 40.h,
                  margin: EdgeInsets.symmetric(horizontal: 16.w),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25.r),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 8,
                        offset: const Offset(0, 1),
                        spreadRadius: 0,
                        color: AppColors.shadowColor
                      )
                    ],
                    color: AppColors.white,
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText:AppText.search,
                      fillColor: AppColors.white,
                      prefixIcon: const Icon(Icons.search),
                      contentPadding: EdgeInsets.symmetric(horizontal: 15.w),
                      border: InputBorder.none
                    ),
                  ),
                ),
                ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder:(context,index){
                      var brand=_filterController.brandList.value[index];
                  return  Obx(()=>
                     ListTileTheme(
                       dense: true,
                       minVerticalPadding:0,
                       child: CheckboxListTile(
                         selectedTileColor: AppColors.primary,
                         activeColor: AppColors.primary,
                        title:Text(brand,style: CustomTextStyle.h3(color:_filterController.selectBrand.contains(brand)?AppColors.primary:AppColors.blackColor),),
                        value:_filterController.selectBrand.value.contains(brand),
                        onChanged: (value) {
                          if(_filterController.selectBrand.contains(brand)){
                            _filterController.selectBrand.remove(brand);
                          }else{
                            _filterController.selectBrand.add(brand);
                          }

                        },
                        checkboxShape:RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.r)
                        ),
                    ),
                     ),
                  );
                }, separatorBuilder: (context,index){
                  return const SizedBox(height:0,);
                }, itemCount:_filterController.brandList.value.length)







            ],
          ),
              )),
          Container(
            height: 104.h,
            width: double.infinity,
            color: AppColors.white,
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomButton(
                  title: AppText.discard,
                  textColor: AppColors.blackColor,
                  onPressed: () {},
                  backgroundColor: AppColors.white,
                  borderColor: AppColors.greyColor,
                  height: 36.h,
                  width: 160.w,
                ),
                CustomButton(
                  title: AppText.apply,
                  onPressed: () {},
                  height: 36.h,
                  width: 160.w,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
