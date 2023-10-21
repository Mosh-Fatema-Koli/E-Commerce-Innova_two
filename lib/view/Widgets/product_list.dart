import 'package:e_commerce/view/Screen/ProductDetails/products_details.dart';
import 'package:e_commerce/view/Widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../utils/dimensions.dart';

class ProductList extends StatelessWidget {
  const ProductList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
    height:300.h,
      child: ListView.separated(
          shrinkWrap: true,
          padding: EdgeInsets.only(left: Dimensions.sidePadding.w),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return  ProductCard(onTap: (){
              Get.to(ProductDetails());
            },);
          },
          separatorBuilder: (context, index) {
            return SizedBox(
              width: 10.w,
            );
          },
          itemCount: 5),
    );
  }
}