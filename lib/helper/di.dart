
import 'package:e_commerce/controller/auth/auth_controller.dart';
import 'package:e_commerce/controller/catalog_controller.dart';
import 'package:e_commerce/view/Screen/ShopScreen/controller/filter_controller.dart';
import 'package:get/get.dart';

import '../controller/forgot_password_controller.dart';

Future init()async{

  Get.lazyPut(() => AuthController());
  Get.lazyPut(() => ForgotPassController());
  Get.lazyPut(() => CatalogController());
  Get.lazyPut(() => FilterController());




}