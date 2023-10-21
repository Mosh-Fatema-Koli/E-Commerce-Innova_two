import 'package:e_commerce/utils/app_text.dart';
import 'package:e_commerce/view/Widgets/custom_back_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/color.dart';
import '../../../utils/styles.dart';

class OrderDetailsScreen extends StatelessWidget {
  const OrderDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const CustomBackButton(),
       centerTitle: true,
       title: Text(AppText.orderDetails),
       actions: [
         IconButton(onPressed: (){}, icon:const Icon(Icons.search))
       ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal:16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20.h,),

            //<---------------- order number and date ------------>
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
            SizedBox(height: 15.h,),


            //<---------------- Tracking number  and status ------------>
            Row(
              children: [
                Expanded(
                  child: RichText(
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
                ),
                Text(
                  AppText.delivered,
                  style: CustomTextStyle.h4(
                      fontWeight: FontWeight.w500, color: AppColors.success),
                )
              ],
            ),
            SizedBox(height: 15.h,),
            //<---------------- total items ------------>
            Text(
              "5 items",
              style: CustomTextStyle.h4(
                  fontWeight: FontWeight.w500,),
            ),
            //
            ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder:(context,index){
              return   Container(
                height: 104.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.r),
                    color: AppColors.white,
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 25,
                          spreadRadius: 0,
                          offset: const Offset(0, 1),
                          color: AppColors.shadowColor
                      )
                    ]
                ),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(8.r),bottomLeft: Radius.circular(8.r)),
                      child: Image.network("https://images.unsplash.com/photo-1505740420928-5e560c06d30e?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8cHJvZHVjdHxlbnwwfHwwfHx8MA%3D%3D&w=1000&q=80",height:double.infinity,width:104.h ,fit: BoxFit.fill,),
                    ),

                    Expanded(child:Padding(
                      padding:  EdgeInsets.symmetric(horizontal:12.w),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          Text("Shirt",style: CustomTextStyle.h2(fontWeight: FontWeight.w600),maxLines: 1,overflow: TextOverflow.ellipsis,),
                          SizedBox(height: 4.h,),
                          Text("LIME",style: CustomTextStyle.h3(color: AppColors.greyColor),maxLines: 1,overflow: TextOverflow.ellipsis,),
                          SizedBox(height: 4.h,),
                          Row(
                            children: [
                              Expanded(
                                flex:3,
                                child: RichText(text:TextSpan(
                                    text: "Color: ",
                                    style:CustomTextStyle.h5(color: AppColors.greyColor),
                                    children: [
                                      TextSpan(
                                        text: "Blue",
                                        style:CustomTextStyle.h5(fontWeight: FontWeight.w500),

                                      )
                                    ]
                                )),
                              ) ,


                              Expanded(
                                flex: 4,
                                child: RichText(text:TextSpan(
                                    text: "Size: ",
                                    style:CustomTextStyle.h5(color: AppColors.greyColor),
                                    children: [
                                      TextSpan(
                                        text: "L",
                                        style:CustomTextStyle.h5(fontWeight: FontWeight.w500),

                                      )
                                    ]
                                )),
                              )
                            ],
                          ),
                          SizedBox(height: 8.h,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              RichText(text:TextSpan(
                          text: "Units: ",
                              style:CustomTextStyle.h5(color: AppColors.greyColor),
                              children: [
                                TextSpan(
                                  text: "1",
                                  style:CustomTextStyle.h5(fontWeight: FontWeight.w500),

                                )
                              ]
                          )),

                              Text("50\$",style: CustomTextStyle.h4(fontWeight: FontWeight.w500),),



                            ],
                          ),


                        ],
                      ),
                    ))
                  ],
                ),
              );

            }, separatorBuilder:(context,index){
              return SizedBox(height:24.h ,);
            }, itemCount: 3)




          ],
        ),
      ),


    );
  }
}
