import 'package:e_commerce/controller/forgot_password_controller.dart';
import 'package:e_commerce/utils/dimensions.dart';
import 'package:e_commerce/utils/styles.dart';
import 'package:e_commerce/view/Widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../utils/color.dart';
import '../../../Widgets/block_header.dart';
import '../../../Widgets/custom_back_button.dart';
import '../../../Widgets/custom_text_form_field.dart';

class ForgotPasswordScreen extends StatelessWidget {
  ForgotPasswordScreen({super.key});
  final _forgotPassController =Get.put(ForgotPassController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const CustomBackButton(),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const BlockHeader( title:"Forgot password"),

            SizedBox(height:87.h,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: Dimensions.sidePadding.w),
              child: Text("Please, enter your email address. You will receive a link to create a new password via email.",style:CustomTextStyle.h4(fontWeight: FontWeight.w500,height:2.sp),),
            )
            ,
            SizedBox(height:16.h,),
            Obx(() => CustomTextInputField(
              hint:"Email",
              controller:_forgotPassController.emailTextCtrl,
              onChanged: (value){
                if(value.isNotEmpty){
                  _forgotPassController.isCheckEmail.value=true;
                }else{
                  _forgotPassController.isCheckEmail.value=false;
                }
              },
              suffixIcon:_forgotPassController.isCheckEmail.value?Icon(Icons.check,color:AppColors.success,):SizedBox(),
            ), ),
            SizedBox(height: 55.h,),
            CustomButton(title:"SEND", onPressed: (){})



          ],
        ),
      ),


    );
  }
}
