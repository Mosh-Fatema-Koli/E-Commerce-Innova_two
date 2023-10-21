import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(onPressed: (){
      Get.back();
    }, icon:const Icon(Icons.arrow_back_ios));
  }
}
