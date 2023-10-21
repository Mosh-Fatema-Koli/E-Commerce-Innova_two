import 'package:e_commerce/view/Screen/Auth/ForgotPassword/forgot_password.dart';
import 'package:e_commerce/view/Screen/Auth/sign_in_screen.dart';
import 'package:e_commerce/view/Screen/Auth/sign_up_screen.dart';
import 'package:e_commerce/view/Screen/CartScreen/cart_screen.dart';
import 'package:e_commerce/view/Screen/CartScreen/screen/check_out_screen.dart';
import 'package:e_commerce/view/Screen/HomeScreen/home_screen.dart';
import 'package:e_commerce/view/Screen/MainScreen/main_screen.dart';
import 'package:e_commerce/view/Screen/OrderScreeen/order_screen.dart';
import 'package:e_commerce/view/Screen/ProfileScreen/profile_screen.dart';
import 'package:e_commerce/view/Screen/ReviewsAndRating/reviews_and_rating.dart';
import 'package:e_commerce/view/Screen/splash/splashScrern.dart';
import 'package:get/get_navigation/get_navigation.dart';

import '../view/Screen/FavoriteScreen/favorite_screen.dart';
import '../view/Screen/ShopScreen/screen/filters_screen.dart';
import '../view/Screen/ShopScreen/shop_screen.dart';

class Routes {
  static String splashScreen="/splash_screen";
  static String signInScreen = "/sign_in_screen";
  static String signupScreen = "/sign_up_screen";
  static String forgotPassScreen = "/forgot_pass_screen";
//  static String mainScreen = "/main_screen";
  static String homeScreen="/home_screen";
  static String shopScreen="/shop_screen";
  static String cartScreen="/cart_screen";
  static String favoriteScreen="/favorite_screen";
  static String profileScreen="/profile_screen";
  static String filterScreen="/filters_screen";
  static String reviewAndRatingScreen="/review_and_rating";
  static String checkOutScreen="/check_out_screen";
  static String orderScreen="/order_screen";

}

List<GetPage> pages = [
  GetPage(name: Routes.signInScreen, page: () => SignInScreen()),
  GetPage(name: Routes.signupScreen, page: () => SignUpScreen()),
  GetPage(name: Routes.forgotPassScreen, page: () => ForgotPasswordScreen()),
  GetPage(name: Routes.splashScreen, page: () => SplashScreen()),
  GetPage(name: Routes.homeScreen, page:()=>HomeScreen()),
  GetPage(name: Routes.shopScreen, page:()=>ShopScreen()),
  GetPage(name: Routes.cartScreen, page:()=>CartScreen()),
  GetPage(name: Routes.favoriteScreen, page:()=>FavoriteScreen()),
  GetPage(name: Routes.profileScreen, page:()=>ProfileScreen()),
  GetPage(name: Routes.filterScreen, page:()=>FilterScreen()),
  GetPage(name: Routes.reviewAndRatingScreen, page:()=> ReviewsAndRating()),
  GetPage(name: Routes.checkOutScreen, page:()=>  CheckOutScreen()),
  GetPage(name: Routes.orderScreen, page:()=>  const OrderScreen()),

];
