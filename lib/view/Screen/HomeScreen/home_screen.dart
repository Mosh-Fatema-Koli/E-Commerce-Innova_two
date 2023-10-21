import 'package:e_commerce/utils/color.dart';
import 'package:e_commerce/utils/dimensions.dart';
import 'package:e_commerce/utils/styles.dart';
import 'package:e_commerce/view/Widgets/custom_button.dart';
import 'package:e_commerce/view/Widgets/favourite_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../Widgets/block_header.dart';
import '../../Widgets/bottom_menu.dart';
import '../../Widgets/product_card.dart';
import '../../Widgets/product_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                height: 544.h,
                width: double.infinity,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage('assets/splash/splash-home.png'),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(
                        left: Dimensions.sidePadding.w,
                      ),
                      width: Get.width / 2,
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text("Fashion\nsale",
                            style: CustomTextStyle.customSize(
                                size: 48.sp,
                                color: AppColors.white,
                                fontWeight: FontWeight.w900)),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(
                          left: Dimensions.sidePadding.w,
                          bottom: Dimensions.sidePadding.h,
                          top: Dimensions.sidePadding.h),
                      width: 160.w,
                      child: CustomButton(
                        title: 'Check',
                        width: 160.w,
                        height: 36.h,
                        onPressed: () {},
                      ),
                    )
                  ],
                )),
            BlockHeader(
              title: 'New',
              linkText: 'View All',
              onLinkTap: () => {},
              description: 'You’ve never seen it before!',
            ),
            SizedBox(
              height: 22.h,
            ),

            const ProductList(),

            SizedBox(
              height: 10.h,
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomMenu(0),
    );
  }
}




