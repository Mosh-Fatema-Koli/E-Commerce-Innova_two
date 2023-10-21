import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../utils/color.dart';
import '../../utils/styles.dart';

class CartCard extends StatelessWidget {
  const CartCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 104.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          color: AppColors.white,
          boxShadow: [
            BoxShadow(
                blurRadius: 25,
                spreadRadius: 0,
                offset: const Offset(0, 1),
                color: AppColors.shadowColor)
          ]),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8.r),
                bottomLeft: Radius.circular(8.r)),
            child: Image.network(
              "https://images.unsplash.com/photo-1505740420928-5e560c06d30e?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8cHJvZHVjdHxlbnwwfHwwfHx8MA%3D%3D&w=1000&q=80",
              height: double.infinity,
              width: 104.h,
              fit: BoxFit.fill,
            ),
          ),
          Expanded(
              child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Shirt",
                      style: CustomTextStyle.h2(fontWeight: FontWeight.w600),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    _popupMenuButton()
                //     GestureDetector(
                //       onTap: (){
                //         _popupMenuButton();
                //       },
                //       child: Icon(
                //         Icons.more_vert,
                //         size: 16.w,
                //         color: AppColors.greyColor,
                //       ),
                //     )
                  ],
                ),
                SizedBox(
                  height: 8.h,
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: RichText(
                          text: TextSpan(
                              text: "Color:",
                              style: CustomTextStyle.h5(
                                  color: AppColors.greyColor),
                              children: [
                            TextSpan(
                              text: "Blue",
                              style: CustomTextStyle.h5(
                                  fontWeight: FontWeight.w500),
                            )
                          ])),
                    ),
                    Expanded(
                      flex: 4,
                      child: RichText(
                          text: TextSpan(
                              text: "Color:",
                              style: CustomTextStyle.h5(
                                  color: AppColors.greyColor),
                              children: [
                            TextSpan(
                              text: "Blue",
                              style: CustomTextStyle.h5(
                                  fontWeight: FontWeight.w500),
                            )
                          ])),
                    )
                  ],
                ),
                SizedBox(
                  height: 8.h,
                ),
                Row(
                  children: [
                    _buildButton(icon: Icons.remove, onTap: () {}),
                    SizedBox(
                      width: 16.w,
                    ),
                    Text(
                      "3",
                      style: CustomTextStyle.h4(fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      width: 16.w,
                    ),
                    _buildButton(icon: Icons.add, onTap: () {}),
                    const Spacer(),
                    Text(
                      "50\$",
                      style: CustomTextStyle.h4(fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ],
            ),
          ))
        ],
      ),
    );
  }

  _buildButton({required Function() onTap, required IconData icon}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          padding: EdgeInsets.all(5.h),
          decoration: BoxDecoration(
              color: AppColors.white,
              boxShadow: [
                BoxShadow(
                    blurRadius: 8,
                    spreadRadius: 0,
                    offset: const Offset(0, 4),
                    color: const Color(0xFF000000).withOpacity(0.1))
              ],
              shape: BoxShape.circle),
          height: 36.h,
          width: 36.h,
          child: Icon(
            icon,
            size: 16.w,
            color: AppColors.greyColor,
          )),
    );
  }

  _popupMenuButton(){
    return SizedBox(
      height: 12.h,
      width: 24.w,
      child: PopupMenuButton(
        //offset: const Offset(0, 40),
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.r),
        ),
        elevation: 2,
        iconSize: 15.w,
        icon: Icon(
          Icons.more_vert,
          color:AppColors.greyColor,
        ),
        itemBuilder: (BuildContext context) => [
          PopupMenuItem(
              value: "add to favorites",
              child: Text("Add to favorites",
                  style:CustomTextStyle.h5())),

          PopupMenuItem(
              value: "Delete from the list",
              child: Text("Delete from the list",
                  style:CustomTextStyle.h5())),

        ],
      ),
    );

  }




}
