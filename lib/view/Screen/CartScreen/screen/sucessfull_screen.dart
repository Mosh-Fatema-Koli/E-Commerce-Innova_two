import 'package:e_commerce/utils/styles.dart';
import 'package:e_commerce/view/Widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../routes/routes.dart';

class SuccessfulScreen extends StatelessWidget {
  const SuccessfulScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(child:Align(
              alignment: Alignment.bottomCenter,
              child: Image.asset("assets/images/checkout/bags.png",fit: BoxFit.fill,height:213.h,width: 208,)),)
          ,
          Expanded(child:Column(
            children: [
              SizedBox(height:49.h,),
              Text("Sucess!",style: CustomTextStyle.h1(fontWeight:FontWeight.w700,),),
              SizedBox(height:8.h,),
              Text("Your order will be delivered soon.\nThank you for choosing our app!",style: CustomTextStyle.h4(height:1.5),textAlign: TextAlign.center,),
              const Spacer(),
              CustomButton(title: "CONTINUE SHOPPING", onPressed:(){
                Get.offNamed(Routes.homeScreen);


              }),
              SizedBox(height:20.h,),
              
              
              
            ],
          ))
        ],
      ),

      
    );
  }
}
