import 'package:e_commerce/helper/di.dart' as di;
import 'package:e_commerce/routes/routes.dart';
import 'package:e_commerce/themes/themes.dart';
import 'package:e_commerce/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
      await   di.init();
  await ScreenUtil.ensureScreenSize();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
     systemNavigationBarColor: AppColors.blackColor, // navigation bar color
    statusBarColor: Colors.transparent, // status bar color
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(375, 812));
    return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'First Method',
          // You can use the library anywhere in the app even in theme
          theme: Themes.themeData(context),
          getPages:pages,
          initialRoute: Routes.splashScreen,

        );

  }
}


