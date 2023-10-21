

import 'package:e_commerce/helper/share_pref_helper.dart';
import 'package:e_commerce/routes/routes.dart';
import 'package:get/get.dart';

class SplashController extends GetxController{


  var isWomen=true.obs;
  RxBool isFirstTime = false.obs;


  jumpPage(){
    Future.delayed(const Duration(seconds: 3),(){
        Get.offAllNamed(Routes.signupScreen);


    });
  }



}