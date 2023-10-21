import 'dart:convert';

import 'package:e_commerce/api/api_checker.dart';
import 'package:e_commerce/api/api_client.dart';
import 'package:e_commerce/api/api_const.dart';
import 'package:e_commerce/helper/share_pref_helper.dart';
import 'package:e_commerce/routes/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController{
//  sign up screen
    var isCheckName=false.obs;
    var isCheckEmail=false.obs;
    var isCheckPhone=false.obs;
    var isCheckPassword=false.obs;
    var isCheckConPassword=false.obs;



  TextEditingController nameTextCtrl=TextEditingController();
  TextEditingController emailTextCtrl=TextEditingController();
  TextEditingController passwordTextCtrl=TextEditingController();
  TextEditingController conPasswordTextCtrl=TextEditingController();
  TextEditingController phoneTextCtrl=TextEditingController();


    // sign in screen
    var isCheckEmailSignIn=false.obs;
    var isCheckPasswordSignIn=false.obs;
    TextEditingController emailTextCtrlSignIn=TextEditingController();
    TextEditingController passwordTextCtrlSignIn=TextEditingController();

    var isLoading =false.obs;




    login()async{


      Map<String, dynamic> data =
      {
        'email': emailTextCtrlSignIn.value.text,
        'password': passwordTextCtrlSignIn.value.text
      };
      isLoading(true);
      Response response = await ApiClient.postData(ApiConstant.loginApi, json.encode(data),
          headers: {'Content-Type': 'application/json'});
      if(response.statusCode==200){

        debugPrint("--------------------check-------------------");
        debugPrint(data["token"].toString());
        var token = response.body['token'];
        debugPrint("token = $token");

        debugPrint("--------------------check-------------------");

        await   PrefsHelper.setString(AppConstant.token, token);


        Get.snackbar("Login Successful","Congratulation",backgroundColor: Colors.indigo[400],colorText: Colors.white);
        Get.offAllNamed(Routes.homeScreen);
      }else{
        ApiChecker.checkApi(response);
      }
      isLoading(false);

    }

    registration()async{

      Map<String, dynamic> data = {

        "name": nameTextCtrl.value.text,
        "email": emailTextCtrl.value.text,
        "password": passwordTextCtrl.value.text,
        "password_confirmation": conPasswordTextCtrl.value.text,
        "phone": phoneTextCtrl.value.text

      };


      isLoading(true);
      Response response = await ApiClient.postData(ApiConstant.registerApi, json.encode(data),
          headers: {'Content-Type': 'application/json'});

      print(response.statusCode);

      if(response.statusCode==200){
        print(response.body);



        Get.snackbar("Registration Successful","Congratulation",backgroundColor: Colors.indigo[400],colorText: Colors.white);

      }else{
        ApiChecker.checkApi(response);
      }
      isLoading(false);

    }

    forgetPass(){

    }

    logout()async{

      Get.offAllNamed(Routes.signInScreen);
      clearSharedData();

    }

    clearSharedData()async{
      SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
      sharedPreferences.clear();

    }




}
