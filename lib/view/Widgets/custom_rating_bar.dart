

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../utils/styles.dart';

class CustomRatingBar extends StatelessWidget {
   CustomRatingBar({
    super.key,
    required this.initialRating,
     this.totalRating,
     this.itemCount,
  });
  double initialRating;
  int? totalRating;
  int? itemCount;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        RatingBar(
          initialRating: initialRating,
          direction: Axis.horizontal,
          allowHalfRating: false,
          ignoreGestures: true,
          itemCount:itemCount??5,
          itemSize: 10.h,
          ratingWidget: RatingWidget(
            full: SvgPicture.asset(
              "assets/icons/products/star_fav.svg",
              fit: BoxFit.fill,
            ),
            empty: SvgPicture.asset(
                "assets/icons/products/star.svg",
                fit: BoxFit.fill),
            half: const SizedBox(),
          ),
          itemPadding:
          EdgeInsets.symmetric(horizontal: 2.w),
          onRatingUpdate: (rating) {
            print(rating);
          },
        ),
       totalRating==null? const SizedBox():Text(
          "($totalRating)",
          style: CustomTextStyle.h6(
              color: Theme.of(context).disabledColor),
        )
      ],
    );
  }
}