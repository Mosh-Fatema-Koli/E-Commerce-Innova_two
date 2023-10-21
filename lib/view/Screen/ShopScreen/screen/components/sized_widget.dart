import 'package:e_commerce/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../utils/color.dart';

class SizedSelect  extends StatelessWidget {
  SizedSelect({
    super.key,
    required this.isSelected,
    required this.sized


  });
  final ValueChanged<bool> isSelected;
  String sized;





  @override
  Widget build(BuildContext context) {
    var isSelect=false.obs;
    return GestureDetector(
      onTap: (){
        isSelect.value=!isSelect.value;
        isSelected(isSelect.value);
      },
      child:
      Obx(()=>
          Container(
            height:40.w,
            width: 40.w,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color:isSelect.value?AppColors.primary:AppColors.white,
              borderRadius: BorderRadius.circular(8.r),
              border: Border.all(
                  width:1,
                  color:isSelect.value?AppColors.primary:AppColors.greyColor
              ),
            ),
            child: Text(sized,style: CustomTextStyle.h4(fontWeight: FontWeight.w500,color:isSelect.value?AppColors.white:AppColors.blackColor),),
          ),
      ),
    );
  }
}