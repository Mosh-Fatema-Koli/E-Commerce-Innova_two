import 'package:e_commerce/controller/auth/auth_controller.dart';
import 'package:e_commerce/routes/routes.dart';
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

import '../../Widgets/social_media_button.dart';

class SignInScreen extends StatelessWidget {
   SignInScreen({super.key});
  final _authController =Get.put(AuthController());

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        leading: const CustomBackButton(),
      ),

      body: SingleChildScrollView(

        child: Obx(()=>
           Column(
            children: [
              const BlockHeader( title:"Sign in"),
              SizedBox(height:73.h,),
              CustomTextInputField(
                hint:"Email",
                controller:_authController.emailTextCtrlSignIn,
                onChanged: (value){
                  if(value.isNotEmpty){
                    _authController.isCheckEmailSignIn.value=true;
                  }else{
                    _authController.isCheckEmailSignIn.value=false;
                  }
                },
                suffixIcon:_authController.isCheckEmailSignIn.value?Icon(Icons.check,color:AppColors.success,):SizedBox(),
              ),  SizedBox(height: 8.h,),
              CustomTextInputField(
                hint:"Password",
                controller:_authController.passwordTextCtrlSignIn,
                isPassword: true,
                onChanged: (value){
                  if(value.isNotEmpty){
                    _authController.isCheckPasswordSignIn.value=true;
                  }else{
                    _authController.isCheckPasswordSignIn.value=false;
                  }
                },
                suffixIcon:_authController.isCheckPasswordSignIn.value?Icon(Icons.check,color:AppColors.success,):SizedBox(),
              ),

              SizedBox(height: 16.h,),
         RightArrow("Forgot your password?",

             onClick: (){
           Get.toNamed(Routes.forgotPassScreen);

             }),

              SizedBox(height: 28.h,),
              CustomButton(title:"LOGIN", onPressed: (){
                _authController.login();
              }),
              SizedBox(height: 10.h,),
              GestureDetector(
                onTap: (){
                  Get.offAllNamed(Routes.signupScreen);
                },
                child: Padding(
                  padding:  EdgeInsets.symmetric(horizontal:5.w),
                  child: RichText(

                      textAlign: TextAlign.center,
                      text: TextSpan(

                          text:"Don't have you any account?",
                          style: CustomTextStyle.h5(color:AppColors.greyColor,height:1.4),
                          children: [
                            TextSpan(
                                text: "Sign Up",
                                style: CustomTextStyle.h5(fontWeight: FontWeight.w500,color: Theme.of(context).iconTheme.color)
                            )
                          ]
                      )),
                ),
              ),
              SizedBox(height: 194.h,),
              Text("Or login  with social account",style:CustomTextStyle.h4(fontWeight: FontWeight.w500,),)

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

