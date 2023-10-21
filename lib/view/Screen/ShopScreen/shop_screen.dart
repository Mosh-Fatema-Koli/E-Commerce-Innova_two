import 'package:e_commerce/utils/app_text.dart';
import 'package:e_commerce/utils/color.dart';
import 'package:e_commerce/utils/styles.dart';
import 'package:e_commerce/view/Screen/ShopScreen/screen/catalog_screen.dart';
import 'package:e_commerce/view/Widgets/custom_back_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../Widgets/bottom_menu.dart';

class ShopScreen extends StatelessWidget {
  const ShopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            leading: const CustomBackButton(),
            centerTitle: true,
            title: Text(
              AppText.categories,
              style: CustomTextStyle.h2(
                  fontWeight: FontWeight.w700, color: AppColors.blackColor),
            ),
            // elevation:2,
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(44.h),
              child: TabBar(
                  unselectedLabelColor: AppColors.blackColor,
                  indicatorColor: AppColors.primary,
                  labelStyle: CustomTextStyle.h3(fontWeight: FontWeight.w600),
                  labelColor: AppColors.blackColor,
                  unselectedLabelStyle: CustomTextStyle.h3(),
                  tabs: [
                    Tab(
                      text: "Women",
                    ),
                    Tab(
                      text: "Men",
                    ),
                    Tab(
                      text: "Kids",
                    ),
                  ]),
            ),
          ),
          bottomNavigationBar: const BottomMenu(1),
          body: TabBarView(children: [
            buildListView(),
            buildListView(),
            buildListView(),
          ]),
        ));
  }

  buildListView() {
    return ListView.separated(
        padding:
            EdgeInsets.symmetric(vertical: 16.h,horizontal: 16.w),
        itemBuilder: (context, index) {
          if (index == 0) {
            return Container(
              height: 100.h,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(8.r),
                  boxShadow: [
                    BoxShadow(
                        spreadRadius: 0,
                        blurRadius: 25,
                        color: AppColors.shadowColor,
                        offset: const Offset(0, 1))
                  ]),
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "SUMMER SALES",
                    style: CustomTextStyle.h1(color: AppColors.white),
                  ),
                  Text(
                    "Up to 50% off",
                    style: CustomTextStyle.h4(
                        fontWeight: FontWeight.w500, color: AppColors.white),
                  )
                ],
              ),
            );
          } else {
            return GestureDetector(
              onTap: (){
                Get.to( CatalogScreen());
              },

              child: Container(
                height: 100.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.r),
                    color: AppColors.white,
                    boxShadow: [
                      BoxShadow(
                          spreadRadius: 0,
                          blurRadius: 25,
                          color: AppColors.shadowColor,
                          offset: const Offset(0, 1))
                    ]),
                child: Row(
                  children: [
                    Expanded(
                        child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 23.w),
                            child: Text(
                              "Clothes",
                              style: CustomTextStyle.h2(),
                            ))),
                    Expanded(
                        child: ClipRRect(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(8.r),
                          bottomRight: Radius.circular(8.r)),
                      child: Image.asset(
                        "assets/thumbs/category/new.png",
                        fit: BoxFit.fill,
                      ),
                    ))
                  ],
                ),
              ),
            );
          }
        },
        separatorBuilder: (context, index) {
          return SizedBox(
            height: 16.h,
          );
        },
        itemCount: 10);
  }
}
