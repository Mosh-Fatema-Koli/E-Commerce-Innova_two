import 'package:e_commerce/routes/routes.dart';
import 'package:e_commerce/utils/color.dart';
import 'package:e_commerce/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../Widgets/bottom_menu.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const SizedBox(),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.search,
                size: 20.sp,
              ))
        ],
      ),
      body: SingleChildScrollView(
     //   padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 15.h,
            ),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 16.w),
              child: Text(
                "My profile",
                style: CustomTextStyle.h1(fontWeight: FontWeight.w700),
              ),
            ),
            SizedBox(
              height: 15.h,
            ),
            
            // <------------- profile ------------->
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 16.w),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 30.r,
                    backgroundImage:
                        const AssetImage("assets/profile/user-profile.jpeg"),
                  ),
                  SizedBox(
                    width: 16.w,
                  ),
                  Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Matilda Brown",
                        style: CustomTextStyle.h2(fontWeight: FontWeight.w500),
                      ),
                      Text(
                        "Matildabrown@gmail.com",
                        style: CustomTextStyle.h3(color: AppColors.greyColor),
                      ),
                    ],
                  ))
                ],
              ),
            ),
            SizedBox(
              height: 25.h,
            ),

            //  <--------------- My Orders -------------->
            
            buildListTile(
              title: "My orders",
              sub: "Already have 12 orders",
              onTap: (){
                Get.toNamed(Routes.orderScreen);

              }
            ),
            _divider(),
            buildListTile(
              title: "Shipping addresses",
              sub: "3 ddresses",
              onTap: (){

              }
            ),
            _divider(),
            buildListTile(
              title: "Payment methods",
              sub: "Visa **34",
              onTap: (){

              }
            ),
            _divider(),

            buildListTile(
              title: "Promocodes",
              sub: "You have special promocodes",
              onTap: (){

              }
            ),
            _divider(),
            buildListTile(
              title: "My reviews",
              sub: "Reviews for 4 items",
              onTap: (){

              }
            ),
            _divider(),
            buildListTile(
              title: "Settings",
              sub: "Notifications, password",
              onTap: (){

              }
            ),
            
            
          ],
        ),
      ),
      bottomNavigationBar: const BottomMenu(4),
    );
  }

   buildListTile({required String title,sub,required Function() onTap}) {
    return ListTile(
      onTap: onTap,
            dense: true,
            minVerticalPadding: 0,
            minLeadingWidth: 0,
           // visualDensity: const VisualDensity(vertical:-4),
            contentPadding: EdgeInsets.symmetric(horizontal: 16.w),
            title: Text(title,style: CustomTextStyle.h2(fontWeight: FontWeight.w600),),
            subtitle: Text(sub,style:CustomTextStyle.h4(color: AppColors.greyColor),),
          trailing: Icon(Icons.arrow_forward_ios_rounded,size: 16.sp,color: AppColors.greyColor,),

          );
  }
  _divider(){
    return Container(
      height: 1,
        width: double.infinity,
      color: AppColors.greyColor.withOpacity(0.05),
    );
  }
}
