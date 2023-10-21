import 'package:e_commerce/view/Screen/ShopScreen/shop_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../view/Screen/HomeScreen/home_screen.dart';

class MainController extends GetxController{

  var selectIndex=0.obs;
  List pagelist=[
    const HomeScreen(),
    ShopScreen(),
    Container(color: Colors.black,),
    Container(color: Colors.amber,),
    Container(color: Colors.red,),

  ];

  changePage(int value){
    selectIndex.value=value;
  }



}