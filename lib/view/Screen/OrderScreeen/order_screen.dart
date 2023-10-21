import 'package:e_commerce/utils/app_text.dart';
import 'package:e_commerce/utils/color.dart';
import 'package:e_commerce/utils/dimensions.dart';
import 'package:e_commerce/utils/styles.dart';
import 'package:e_commerce/view/Widgets/custom_back_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'order_details.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const CustomBackButton(),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.search,
                size: 20.sp,
              ))
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 15.h,
          ),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 16.w),
            child: Text(
              "My Orders",
              style: CustomTextStyle.h1(
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          SizedBox(
            height: 24.h,
          ),
          SizedBox(
            height: 30.h,
            child: TabBar(
              padding: EdgeInsets.only(left:16.w),
                controller: _tabController,
                labelPadding: EdgeInsets.zero,
                // indicatorSize: TabBarIndicatorSize.label,
                unselectedLabelColor: AppColors.blackColor,
                labelColor: AppColors.white,
                indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(25.r),
                    color: AppColors.blackColor),
                tabs: [
                  Tab(
                    text: AppText.delivered,
                  ),
                  Tab(
                    text: AppText.processing,
                  ),
                  Tab(
                    text: AppText.cancelled,
                  ),
                ]),
          ),

          Expanded(
              child: TabBarView(controller: _tabController, children: [
            ListView.separated(
              itemCount: 5,
              padding: EdgeInsets.symmetric(horizontal:16.w,vertical:20.h),
              itemBuilder: (context, index) {
                return  OrderCard(
                  isStatus: AppText.delivered,
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(
                  height: 24.h,
                );
              },
            ),
            ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return  OrderCard( isStatus: AppText.processing,);
                }),
            ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return  OrderCard( isStatus: AppText.cancelled,);
                }),
          ])),
        ],
      ),
    );
  }
}

class OrderCard extends StatelessWidget {
   OrderCard({
    super.key,
    required this.isStatus
  });
    String isStatus;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          color: AppColors.white,
          boxShadow: [
            BoxShadow(
                blurRadius: 24,
                spreadRadius: 0,
                offset: const Offset(0, 1),
                color: AppColors.shadowColor)
          ]),
      padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 19.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                  child: Text(
                "Order Ne13234234",
                style: CustomTextStyle.h3(fontWeight: FontWeight.w500),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              )),
              Text(
                "05-12-2022",
                style: CustomTextStyle.h4(color: AppColors.greyColor),
              ),
            ],
          ),
          SizedBox(
            height: 12.h,
          ),
          RichText(
              text: TextSpan(
                  text: "Tracking number: ",
                  style: CustomTextStyle.h4(color: AppColors.greyColor),
                  children: [
                TextSpan(
                    text: "Iw46644664646",
                    style: CustomTextStyle.h4(
                        fontWeight: FontWeight.w500,
                        color: AppColors.blackColor))
              ])),
          SizedBox(
            height: 5.h,
          ),
          Row(
            children: [
              //<----------- Quantity --------->
              Expanded(
                  child: RichText(
                      text: TextSpan(
                          text: "Quantity: ",
                          style: CustomTextStyle.h4(color: AppColors.greyColor),
                          children: [
                    TextSpan(
                        text: "5",
                        style: CustomTextStyle.h3(
                            fontWeight: FontWeight.w500,
                            color: AppColors.blackColor))
                  ]))),
              //<----------- total amount --------->
              RichText(
                  text: TextSpan(
                      text: "Total Amount: ",
                      style: CustomTextStyle.h4(color: AppColors.greyColor),
                      children: [
                TextSpan(
                    text: "112\$",
                    style: CustomTextStyle.h3(
                        fontWeight: FontWeight.w500,
                        color: AppColors.blackColor))
              ]))
            ],
          ),
          SizedBox(
            height: 17.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: 36.h,
                child: OutlinedButton(
                    onPressed: () {
                      Get.to(const OrderDetailsScreen());
                    },
                    style: OutlinedButton.styleFrom(
                      shape: StadiumBorder(
                          side: BorderSide(color: AppColors.blackColor)),
                    ),
                    child: Text(
                      "Details",
                      style: CustomTextStyle.h4(
                          fontWeight: FontWeight.w500,
                          color: AppColors.blackColor),
                    )),
              ),
              Text(
                isStatus,
                style: CustomTextStyle.h4(
                    fontWeight: FontWeight.w500, color: AppColors.success),
              )
            ],
          )
        ],
      ),
    );
  }
}
