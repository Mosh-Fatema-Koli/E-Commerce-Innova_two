import 'package:e_commerce/utils/app_text.dart';
import 'package:e_commerce/utils/color.dart';
import 'package:e_commerce/utils/dimensions.dart';
import 'package:e_commerce/utils/styles.dart';
import 'package:e_commerce/view/Screen/ShopScreen/controller/filter_controller.dart';
import 'package:e_commerce/view/Screen/ShopScreen/screen/brand_sreen.dart';
import 'package:e_commerce/view/Widgets/custom_back_button.dart';
import 'package:e_commerce/view/Widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'components/sized_widget.dart';

class FilterScreen extends StatelessWidget {
   FilterScreen({super.key});
  final _filterController = Get.put(FilterController());

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        leading: const CustomBackButton(),
        title: Text(AppText.filters),
        elevation: 3,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  _headerTitle(title:AppText.priceRange),
                  _rangeSlider(),
                  _headerTitle(title:AppText.colors),
                  _colors(),
                  _headerTitle(title:AppText.sizes),
                   _sized(),
                  _headerTitle(title:AppText.category),
                  _category(),
                  _headerTitle(title:AppText.brand,onTab:(){
                    Get.to( BrandScreen());
                  },des:"adidas Originals, Jack & Jones, s.Oliver"),






                ],
              ),
            ),
          ),
          Container(
            height: 104.h,
            width: double.infinity,
            color: AppColors.white,
            padding:EdgeInsets.symmetric(horizontal:16.w,vertical:20.h),
            child:Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomButton(title:AppText.discard, textColor:AppColors.blackColor,onPressed: (){},backgroundColor:AppColors.white,borderColor: AppColors.greyColor,height:36.h,width: 160.w,)
              ,
                CustomButton(title:AppText.apply, onPressed: (){},height:36.h,width: 160.w,)


              ],
            ),

          )
        ],
      ),
    );
  }

   _category() {
    return Container(
            color: AppColors.white,
            width: double.infinity,
            padding: EdgeInsets.symmetric(
                horizontal: Dimensions.sidePadding.w, vertical: 24.h),
            child: Wrap(
              children:_filterController.categoryList.map((e) => GestureDetector(
                onTap: () {
                  _filterController.selectCategory.value=e;
                },
                child: Obx(()=>
                   Container(
                    height:40.h,
                    width: 90.w,
                    margin: EdgeInsets.only(right:20.w,bottom: 12.h),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.r),
                      color: _filterController.selectCategory.value==e?AppColors.primary:AppColors.white,
                      border: Border.all(
                        color:_filterController.selectCategory.value==e?AppColors.primary:AppColors.greyColor
                      )
                    ),
                    alignment: Alignment.center,
                    child: Text(e,style:CustomTextStyle.h4(fontWeight: FontWeight.w500,color:_filterController.selectCategory.value==e?AppColors.white:AppColors.blackColor),),


                  ),
                ),
              )).toList(),
            ),

          );
  }

   _sized() {
    return Container(
        height: 92.h,
        width: double.infinity,
        color: AppColors.white,
        padding: EdgeInsets.symmetric(
            horizontal: Dimensions.sidePadding.w, vertical: 24.h),
          child:  ListView.separated(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder:(context ,index){
                var color=_filterController.colorList.value[index];
                return SizedSelect(
                    isSelected:(value){
                  if(value){
                    _filterController.selectSized.value.add(_filterController.sizeList.value[index]);
                  }else{
                    _filterController.selectSized.value.remove(_filterController.sizeList.value[index]);
                  }

                }, sized:_filterController.sizeList.value[index]);



              }, separatorBuilder: (context,index){
            return SizedBox(width:18.w,);
          }, itemCount:_filterController.sizeList.length),


      );
  }

   _colors( ) {
    return Container(
            height: 92.h,
            color: AppColors.white,
            padding: EdgeInsets.symmetric(
                horizontal: Dimensions.sidePadding.w, vertical: 24.h),
          child:
             ListView.separated(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder:(context ,index){
                  var color=_filterController.colorList.value[index];
              return Obx(()=>
                 GestureDetector(
                  onTap: (){
                  _filterController.toggleSelection(index);
                    // if(_filterController.selectColor.value.contains(color)){
                    //   _filterController.selectColor.value.remove(color);
                    // }else{
                    //   _filterController.selectColor.value.add(color);
                    //
                    // }

                  },
                  child:
                     Container(
                            height:44.sp,
                            width: 44.sp,
                            padding: EdgeInsets.all(2.sp),
                            decoration: BoxDecoration(
                              color: AppColors.white,
                              shape: BoxShape.circle,
                              border: Border.all(
                                width:1,
                                color:_filterController.selectColor[index].value?color:Colors.transparent
                              ),
                            ),
                            child: Container(
                              height: double.infinity,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: color
                              ),
                            ),
                          ),
                  ),

              );

            }, separatorBuilder: (context,index){
              return SizedBox(width:18.w,);
            }, itemCount:_filterController.colorList.length),
          );
  }

   _rangeSlider() {
    return Container(
            color: AppColors.white,
            padding: EdgeInsets.symmetric(
                horizontal: Dimensions.sidePadding.w, vertical: 24.h),
            child: Column(
              children: [
                Obx(()=>
                   Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(_filterController.lowerValue.value.floor().toString(),style:CustomTextStyle.h4(fontWeight: FontWeight.w500,),),
                      Text(_filterController.upperValue.value.floor().toString(),style:CustomTextStyle.h4(fontWeight: FontWeight.w500,),),

                    ],
                  ),
                ),
                Obx(()=>
                   SliderTheme(
                     data: SliderThemeData(
                        overlayShape: SliderComponentShape.noThumb
                     ),
                     child: RangeSlider(
                      activeColor: AppColors.primary,
                      inactiveColor: AppColors.greyColor,

                      values: RangeValues(_filterController.lowerValue.value,
                          _filterController.upperValue.value),

                      max: 500,
                      min: 0,
                      //  divisions: 5,
                      // labels: RangeLabels(
                      //   _filterController.currentRangeValues.start.round().toString(),
                      //   _filterController.currentRangeValues.end.round().toString(),
                      // ),
                      onChanged: (RangeValues values) {
                        _filterController.updateValues(values);
                      },
                  ),
                   ),
                )
              ],
            ),
          );
  }

  _headerTitle({required String title, String? des, Function()? onTab}) {
    return Container(
      //height: 42.h,
      width: double.infinity,
      padding: EdgeInsets.only(left: 16.w),
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(color: AppColors.bgColor, boxShadow: [
        BoxShadow(
            blurRadius: 2,
            spreadRadius: 0,
            offset: const Offset(0, 2),
            color: AppColors.shadowColor)
      ]),
      child: ListTile(
        dense: true,
        contentPadding: EdgeInsets.zero,
        minLeadingWidth: 0,
        minVerticalPadding: 0,
        horizontalTitleGap: 0,
        visualDensity: VisualDensity(vertical:-4,horizontal: 0),
        onTap: onTab,
        title: Text(title, style: CustomTextStyle.h3()),
        subtitle:des==null? const SizedBox():Text(
          des,
          style: CustomTextStyle.h5(color: AppColors.greyColor),
        ),
        trailing: des == null
            ? const SizedBox()
            : const Icon(
                Icons.keyboard_arrow_right_sharp,
              ),
      ),
    );
  }
}


