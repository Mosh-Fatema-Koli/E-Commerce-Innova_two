import 'package:e_commerce/controller/auth/auth_controller.dart';
import 'package:e_commerce/utils/app_text.dart';
import 'package:e_commerce/utils/color.dart';
import 'package:e_commerce/utils/icons.dart';
import 'package:e_commerce/utils/styles.dart';
import 'package:e_commerce/view/Widgets/block_header.dart';
import 'package:e_commerce/view/Widgets/custom_back_button.dart';
import 'package:e_commerce/view/Widgets/custom_button.dart';
import 'package:e_commerce/view/Widgets/custom_text_form_field.dart';
import 'package:e_commerce/view/Widgets/right_arrow_action.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../routes/routes.dart';
import '../../../utils/dimensions.dart';
import '../../Widgets/social_media_button.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});
  final _authController =Get.put(AuthController());

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
       automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(


        child: Obx(()=>
            Column(
              children: [
             const BlockHeader( title:"Sign up"),


                SizedBox(height:50.h,),
                CustomTextInputField(
                  hint:"Name",
                  controller:_authController.nameTextCtrl,
                  onChanged: (value){
                    if(value.isNotEmpty){
                      _authController.isCheckName.value=true;
                    }else{
                      _authController.isCheckName.value=false;
                    }
                  },
                  suffixIcon:_authController.isCheckName.value?Icon(Icons.check,color:AppColors.success,):SizedBox(),
                ),
                SizedBox(height:8.h,),
                CustomTextInputField(
                  hint:"Email",
                  controller:_authController.emailTextCtrl,
                  onChanged: (value){
                    if(value.isNotEmpty){
                      _authController.isCheckEmail.value=true;
                    }else{
                      _authController.isCheckEmail.value=false;
                    }
                  },
                  suffixIcon:_authController.isCheckEmail.value?Icon(Icons.check,color:AppColors.success,):SizedBox(),
                ),
                SizedBox(height:8.h,),
                CustomTextInputField(
                  hint:"phone",
                  controller:_authController.phoneTextCtrl,
                  onChanged: (value){
                    if(value.isNotEmpty){
                      _authController.isCheckPhone.value=true;
                    }else{
                      _authController.isCheckPhone.value=false;
                    }
                  },
                  suffixIcon:_authController.isCheckPhone.value?Icon(Icons.check,color:AppColors.success,):SizedBox(),
                ),
                SizedBox(height: 8.h,),
                CustomTextInputField(
                  hint:"Password",
                  controller:_authController.passwordTextCtrl,
                  isPassword: true,
                  onChanged: (value){
                    if(value.isNotEmpty){
                      _authController.isCheckPassword.value=true;
                    }else{
                      _authController.isCheckPassword.value=false;
                    }
                  },
                  suffixIcon:_authController.isCheckPassword.value?Icon(Icons.check,color:AppColors.success,):SizedBox(),
                ),
                SizedBox(height: 8.h,),
                CustomTextInputField(
                  hint:"Confirm Password",
                  controller:_authController.conPasswordTextCtrl,
                  isPassword: true,
                  onChanged: (value){
                    if(value.isNotEmpty){

                      _authController.isCheckConPassword.value=true;
                    }
                    else{
                      _authController.isCheckConPassword.value=false;
                    }
                  },
                  suffixIcon:_authController.isCheckPassword.value?Icon(Icons.check,color:AppColors.success,):SizedBox(),
                ),

                SizedBox(height: 16.h,),
                RightArrow("Already have an account?",

                    onClick: (){
                  Get.toNamed(Routes.signInScreen);

                    }),

                SizedBox(height: 28.h,),
                CustomButton(title:"SIGN UP", onPressed: (){
                  _authController.registration();
                }),
                SizedBox(height: 30.h,),
                Text("Or sign up with social account",style: CustomTextStyle.h4(fontWeight: FontWeight.w500,),)

                ,
                SizedBox(height: 12.h,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SocialMediaButton(icon:AppIcons.googleIcon, onTap: () {  },)
                    ,
                    SizedBox(width:16.w,),
                    SocialMediaButton(icon:AppIcons.facebookIcon, onTap: () {  },)


                  ],
                )












              ],
            ),
        ),
      ),

    );
  }
}

