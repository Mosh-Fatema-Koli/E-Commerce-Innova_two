import 'package:e_commerce/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../controller/catalog_controller.dart';
import '../../../routes/routes.dart';
import '../../../utils/dimensions.dart';
import '../../../utils/styles.dart';
import '../../Widgets/bottom_menu.dart';
import '../../Widgets/custom_back_button.dart';
import '../../Widgets/favorite_card_horizontal.dart';
import '../../Widgets/product_card_horizontal.dart';
import '../ProductDetails/products_details.dart';

class FavoriteScreen extends StatelessWidget {
   FavoriteScreen({super.key});
  final _catalogController = Get.put(CatalogController());
  var current = 0.obs;
  @override
  Widget build(BuildContext context) {
    var items = _catalogController.catagoryList;
    return  Scaffold(
      body: SafeArea(child:Column(
        children: [

          _headerSection(items),
          Expanded(
            child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: Dimensions.sidePadding.w,vertical: Dimensions.sidePadding.h),
                itemBuilder: (context,index){
                  return  FavoriteCardHorizontal(onTap: () {  },);
                }, separatorBuilder:(context,index){
              return SizedBox(height: 10.h,);
            }, itemCount: 10),
          )
        ],
      )),

      bottomNavigationBar: BottomMenu(3),
    );
  }

  _headerSection(List<String> items) {
    return Container(
      decoration: BoxDecoration(color: AppColors.bgColor, boxShadow: [
        BoxShadow(
            blurRadius: 12,
            spreadRadius: 0,
            offset: const Offset(0, 4),
            color: AppColors.shadowColor)
      ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// <---------------------- app bar ---------------------->
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              CustomBackButton(),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.search,
                  ))
            ],
          ),
          SizedBox(
            height: 18.h,
          ),
          /// <----------------------  Name ---------------------->
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: Dimensions.sidePadding.w),
            child: Text(
              "Favorites",
              style: CustomTextStyle.h1(fontWeight: FontWeight.w700),
            ),
          ),
          SizedBox(
            height: 12.h,
          ),
          /// <---------------------- tab bar ---------------------->
          Container(
            width: double.infinity,
            padding: EdgeInsets.only(left: Dimensions.sidePadding.w),
            height: 30.h,
            child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: items.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (ctx, index) {
                  return GestureDetector(
                    onTap: () {
                      current.value = index;
                    },
                    child: AnimatedContainer(
                      height: double.infinity,
                      duration: const Duration(milliseconds: 300),
                      padding: EdgeInsets.symmetric(horizontal: 12.w),
                      margin: EdgeInsets.symmetric(horizontal: 4.w),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(29.r),
                          color: AppColors.blackColor),
                      child: Center(
                        child: Text(
                          items[index],
                          style: CustomTextStyle.h4(
                              fontWeight: FontWeight.w500,
                              color: AppColors.white),
                        ),
                      ),
                    ),
                  );
                }),
          ),
          SizedBox(
            height: 18.h,
          ),
          /// <---------------------- Filter section ---------------------->
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap:(){
                  Get.toNamed(Routes.filterScreen);
                },
                child: Row(
                  children: [
                    SizedBox(
                      width: Dimensions.sidePadding.w,
                    ),
                    Icon(
                      Icons.filter_list_sharp,
                      size: 24.h,
                    ),
                    Text(
                      "Filter",
                      style: CustomTextStyle.h5(),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    )
                  ],
                ),
              ),
              GestureDetector(
                onTap: (){

                },
                child: Row(
                  children: [
                    Icon(
                      Icons.swap_vert,
                      size: 24.h,
                    ),
                    Text(
                      "Price: lowest to high",
                      style: CustomTextStyle.h5(),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    )
                  ],
                ),
              ),
              //  IconButton(onPressed: (){}, icon:Svg)
              Padding(
                  padding:
                  EdgeInsets.only(right: Dimensions.sidePadding.w),
                  child: SvgPicture.asset(
                    "assets/icons/View_modules.svg",
                    height: 24.h,
                    width: 24.h,
                  ))
            ],
          ),
          SizedBox(
            height: 10.h,
          )
        ],
      ),
    );
  }
}
