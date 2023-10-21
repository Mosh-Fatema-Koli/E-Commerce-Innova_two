import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FilterController extends GetxController{

  var lowerValue = 0.0.obs;
  var upperValue = 300.0.obs;
  var selectColor=[].obs;
  var selectSized=[].obs;
  var selectCategory="".obs;
  var selectBrand=[].obs;

  var colorList=[
    Colors.black,
    Colors.red,
    Colors.orange,
    Colors.grey,
    Colors.blue,
    Colors.brown
  ].obs;

  var sizeList=[
    "Xs",
    "S",
    "M",
    "L",
    "Xl"
  ].obs;

  var categoryList=[
    "All",
    "Women",
    "Men",
    "Boys",
    "Girls"
  ];

  RxList<String> brandList=[
    "adidas",
    "Adidas Originals",
    "Blend",
    "Champion",
    "Diesel",
    "Jack & Jones",
    "Naf Naf",
    "Red Valentino",
    "s.Oliver"
  ].obs;



  @override
  void onInit() {
    // TODO: implement onInit
    selectColor.assignAll(List.generate(colorList.length, (index) => false.obs));

    super.onInit();
  }
  void toggleSelection(int index) {
    selectColor[index].value=!selectColor[index].value;

  }

  void updateValues(RangeValues values) {
    lowerValue.value = values.start;
    upperValue.value = values.end;
  }


}