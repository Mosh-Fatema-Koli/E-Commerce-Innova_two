import 'package:e_commerce/utils/app_text.dart';
import 'package:e_commerce/utils/color.dart';
import 'package:e_commerce/utils/dimensions.dart';
import 'package:e_commerce/utils/styles.dart';
import 'package:e_commerce/view/Widgets/custom_back_button.dart';
import 'package:e_commerce/view/Widgets/custom_button.dart';
import 'package:e_commerce/view/Widgets/custom_rating_bar.dart';
import 'package:e_commerce/view/Widgets/custom_text_form_field.dart';
import 'package:e_commerce/view/Widgets/review_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class ReviewsAndRating extends StatelessWidget {
  ReviewsAndRating({super.key});
  final RxBool _isShowPhoto = false.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: const CustomBackButton(),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: Dimensions.sidePadding.w),
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 18.h,
                ),
                Text(
                  AppText.ratingAndReviews,
                  style: CustomTextStyle.h1(fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: 41.h,
                ),
                _reviewSection(),
                SizedBox(
                  height: 33.h,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        "8 reviews",
                        style: CustomTextStyle.customSize(
                            size: 24.sp, fontWeight: FontWeight.w600),
                      ),
                    ),
                    //  const Spacer(),
                    //   Expanded(
                    //     child: CheckboxListTile(value:_isShowPhoto.value,
                    //         title:  Text(
                    //           "With photo",
                    //           style: CustomTextStyle.h4(),
                    //         ),
                    //         activeColor: AppColors.blackColor,
                    //         controlAffinity: ListTileControlAffinity.leading,
                    //         checkboxShape: RoundedRectangleBorder(
                    //             borderRadius: BorderRadius.circular(4.r),
                    //             side: BorderSide(color: AppColors.greyColor)),
                    //         onChanged: (value){
                    //       _isShowPhoto.value=false;
                    //     }),
                    //   ),
                    GestureDetector(
                      onTap: () {
                        _isShowPhoto.value = !_isShowPhoto.value;
                      },
                      child: Row(
                        children: [
                          Obx(
                            () => Checkbox(
                                value: _isShowPhoto.value,
                                activeColor: AppColors.blackColor,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4.r),
                                    side:
                                        BorderSide(color: AppColors.greyColor)),
                                onChanged: (value) {
                                  _isShowPhoto.value = value!;
                                }),
                          ),
                          Text(
                            "With photo",
                            style: CustomTextStyle.h4(),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Obx(() => ReviewCard(
                            isImage: _isShowPhoto.value,
                          ));
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        height: 10.h,
                      );
                    },
                    itemCount: 2)
              ],
            ),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            child: _buildFooter(context),
          ),
        ],
      ),
    );
  }

  _reviewSection() {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Column(
            children: [
              Text(
                "4.3",
                style: CustomTextStyle.customSize(
                    size: 44.sp, fontWeight: FontWeight.w600),
              ),
              Text(
                "23 ratings",
                style: CustomTextStyle.h5(color: AppColors.greyColor),
              )
            ],
          ),
        ),
        Expanded(
          flex: 10,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _ratingAndLinearProgress(
                  totalRating: 1255, initRating: 1, itemCount: 5),
              SizedBox(
                height: 12.h,
              ),
              _ratingAndLinearProgress(
                  totalRating: 5, initRating: 0.8, itemCount: 4),
              SizedBox(
                height: 12.h,
              ),
              _ratingAndLinearProgress(
                  totalRating: 4, initRating: 0.5, itemCount: 3),
              SizedBox(
                height: 12.h,
              ),
              _ratingAndLinearProgress(
                  totalRating: 2, initRating: 0.3, itemCount: 2),
              SizedBox(
                height: 12.h,
              ),
              _ratingAndLinearProgress(
                  totalRating: 1, initRating: 0.1, itemCount: 1),
            ],
          ),
        ),
      ],
    );
  }

  _buildFooter(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
          height: 100.0,
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.white,
                  Colors.white12,
                ],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
          ),
        ),
        Container(
          alignment: Alignment.bottomRight,
          padding: EdgeInsets.only(right: 17.w, bottom: 10.h),
          child: CustomButton(
            title: 'Write a review',
            icon: Icons.edit,
            iconColor: AppColors.white,
            height: 36.h,
            iconSize: 20.h,
            width: MediaQuery.of(context).size.width * 0.5,
            onPressed: () => {_addReviewBottomSheet(context)},
          ),
        ),
      ],
    );
  }
}

_addReviewBottomSheet(BuildContext context) {
  return showModalBottomSheet(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(25.r), topLeft: Radius.circular(25.r))),
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
                left: 16.w,
                right: 16.w),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 14.h,
                ),
                Container(
                  height: 6.h,
                  width: 60.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25.r),
                      color: AppColors.greyColor),
                ),
                SizedBox(height: 16.h),
                Text(
                  "What is you rate?",
                  style: CustomTextStyle.h2(fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 17.h),
                RatingBar(
                  initialRating: 0,
                  direction: Axis.horizontal,
                  allowHalfRating: false,
                  ignoreGestures: false,
                  itemCount: 5,
                  itemSize: 34.w,
                  ratingWidget: RatingWidget(
                    full: SvgPicture.asset(
                      "assets/icons/products/star_fav.svg",
                      fit: BoxFit.fill,
                    ),
                    empty: SvgPicture.asset("assets/icons/products/star.svg",
                        fit: BoxFit.fill),
                    half: const SizedBox(),
                  ),
                  itemPadding: EdgeInsets.symmetric(horizontal: 2.w),
                  onRatingUpdate: (rating) {},
                ),
                SizedBox(height: 34.h),
                Text(
                  "Please share your opinion about the product",
                  style: CustomTextStyle.h2(fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 32.h),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                  ),
                  decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius:
                          BorderRadius.circular(Dimensions.textFieldRadius.r),
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 8,
                            spreadRadius: 0,
                            offset: const Offset(0, 1),
                            color: AppColors.shadowColor)
                      ]),
                  child: TextField(
                    maxLines: 6,
                    style: CustomTextStyle.h4(
                        height: 1.5, letterSpacing: -0.15.sp),
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: "Your reviews",
                    ),
                  ),
                ),
                SizedBox(
                  height: 39.h,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Wrap(
                    children: List.generate(
                        1,
                        (index) => Container(
                              height: 104.w,
                              width: 104.w,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(4.r),
                                  boxShadow: [
                                    BoxShadow(
                                        blurRadius: 30,
                                        spreadRadius: 0,
                                        offset: const Offset(0, -4),
                                        color: AppColors.shadowColor)
                                  ]),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CircleAvatar(
                                    radius: 20.w,
                                    backgroundColor: AppColors.primary,
                                    child: Center(
                                        child: Icon(
                                      Icons.camera_alt,
                                      color: AppColors.white,
                                      size: 26.w,
                                    )),
                                  ),
                                  SizedBox(
                                    height: 12.h,
                                  ),
                                  Text(
                                    "Add your photos",
                                    style: CustomTextStyle.h5(),
                                  )
                                ],
                              ),
                            )),
                  ),
                ),
                SizedBox(
                  height: 44.h,
                ),
                CustomButton(title: "SEND REVIEW", onPressed: () {}),
                SizedBox(
                  height: 10.h,
                ),
              ],
            ),
          ),
        );
      });
}

_ratingAndLinearProgress(
    {required int totalRating,
    required double initRating,
    required double itemCount}) {
  return Row(
    children: [
      Expanded(
        flex: 5,
        child: Row(
          children: [
            const Spacer(),
            CustomRatingBar(
              initialRating: itemCount,
              itemCount: itemCount.toInt(),
            ),
            SizedBox(
              width: 10.w,
            ),
          ],
        ),
      ),
      Expanded(
        flex: 5,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(4.r),
          child: LinearProgressIndicator(
            value: initRating,
            minHeight: 8.h,
            color: AppColors.primary,
            backgroundColor: Colors.transparent,
          ),
        ),
      ),
      Expanded(
          flex: 2,
          child: Align(
              alignment: Alignment.centerRight,
              child: Text(
                totalRating.toString(),
                style: CustomTextStyle.h4(
                    color: AppColors.greyColor, fontWeight: FontWeight.w500),
              )))
    ],
  );
}
