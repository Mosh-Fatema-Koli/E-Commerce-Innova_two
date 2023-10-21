// import 'package:e_commerce/controller/main_controller.dart';
// import 'package:e_commerce/utils/color.dart';
// import 'package:e_commerce/utils/styles.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:get/get.dart';
//
// class MainScreen extends StatelessWidget {
//    MainScreen({super.key});
//   final _mainController =Get.put(MainController());
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       extendBody: true,
//       body:Obx(() => _mainController.pagelist[_mainController.selectIndex.value]),
//       bottomNavigationBar:CustomBottomBar(selectIndex: _mainController.selectIndex.value),
//     );
//   }
//
//
//
// }
//
// class CustomBottomBar extends StatelessWidget {
//    CustomBottomBar({super.key,required this.selectIndex});
//
//     int selectIndex;
//    final _mainController =Get.put(MainController());
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//           borderRadius: BorderRadius.only(
//               topRight: Radius.circular(15.r),topLeft: Radius.circular(15.r)
//           ),
//           boxShadow: const [
//             BoxShadow(color:Colors.black38,spreadRadius:0,blurRadius: 10)
//           ]
//       ),
//       child: ClipRRect(
//         borderRadius: BorderRadius.only(
//             topRight: Radius.circular(15.r),topLeft: Radius.circular(15.r)
//
//         ),
//         child: Obx(()=>
//             BottomNavigationBar(
//
//                 type: BottomNavigationBarType.fixed,
//                 currentIndex:selectIndex,
//                 selectedItemColor:Theme.of(context).primaryColor,
//                 onTap:_mainController.changePage,
//                 //  selectedLabelStyle: CustomTextStyle.h6(color:Theme.of(context).primaryColor),
//                 // unselectedLabelStyle: CustomTextStyle.h6(color:Theme.of(context).disabledColor),
//
//                 items:[
//                   getItem(image: 'assets/icons/bottom_menu/home.svg',title: 'Home',isSelect:_mainController.selectIndex.value==0,context: context),
//                   getItem(image: 'assets/icons/bottom_menu/cart.svg',title: 'Shop',isSelect:_mainController.selectIndex.value==1,context: context),
//                   getItem(image: 'assets/icons/bottom_menu/bag.svg',title: 'Bag',isSelect:_mainController.selectIndex.value==2,context: context),
//                   getItem(image: 'assets/icons/bottom_menu/favorites.svg',title: 'Favorites',isSelect:_mainController.selectIndex.value==3,context: context),
//                   getItem(image: 'assets/icons/bottom_menu/profile.svg',title: 'Profile',isSelect:_mainController.selectIndex.value==4,context: context),
//
//
//                 ]),
//         ),
//       ),
//     );
//   }
//
//   BottomNavigationBarItem getItem(
//       {required String image,
//         required String title,
//         required bool isSelect,
//         required BuildContext context}) {
//     return BottomNavigationBarItem(
//         label: title,
//         icon: SvgPicture.asset(
//           image,
//           height: 24,
//           width: 24,
//           color:isSelect? Theme.of(context).primaryColor:Theme.of(context).disabledColor,
//         ));
//   }
// }
//
