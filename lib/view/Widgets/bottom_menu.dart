import 'package:e_commerce/routes/routes.dart';
import 'package:e_commerce/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class BottomMenu extends StatelessWidget {
  final int menuIndex;

  const BottomMenu(this.menuIndex, {super.key});

  Color colorByIndex(ThemeData theme, int index) {
    return index == menuIndex ? AppColors.primary :theme.disabledColor;
  }

  BottomNavigationBarItem getItem(
      String image, String title, ThemeData theme, int index) {
    return BottomNavigationBarItem(
        label: title,
        icon: SvgPicture.asset(
          image,
          height: 24.0,
          width: 24.0,
          color: colorByIndex(theme, index),
        ));
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    List<BottomNavigationBarItem> menuItems = [
      getItem('assets/icons/bottom_menu/home.svg', 'Home', theme, 0),
      getItem('assets/icons/bottom_menu/cart.svg', 'Shop', theme, 1),
      getItem('assets/icons/bottom_menu/bag.svg', 'Bag', theme, 2),
      getItem('assets/icons/bottom_menu/favorites.svg', 'Favorites', theme, 3),
      getItem(
          'assets/icons/bottom_menu/profile.svg', 'Profile', theme, 4)
    ];

    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(15.r),topLeft: Radius.circular(15.r)
          ),
          boxShadow: const [
            BoxShadow(color:Colors.black38,spreadRadius:0,blurRadius: 10)
          ]
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(15.r),topLeft: Radius.circular(15.r)

        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedItemColor:Theme.of(context).primaryColor,
          currentIndex: menuIndex,
          onTap: (value) {
            switch (value) {
              case 0:
                Get.offAndToNamed(Routes.homeScreen);
                break;
              case 1:
                Get.offAndToNamed(Routes.shopScreen);
                break;
              case 2:
                Get.offAndToNamed(Routes.cartScreen);
                break;
              case 3:
                Get.offAndToNamed(Routes.favoriteScreen);
                break;
              case 4:
                Get.offAndToNamed(Routes.profileScreen);
                break;
            }
          },
          items: menuItems,
        ),
      ),
    );
  }
}
