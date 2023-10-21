import 'package:e_commerce/controller/splashController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});
  final _splashController=Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    _splashController.jumpPage();
    return Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }
}