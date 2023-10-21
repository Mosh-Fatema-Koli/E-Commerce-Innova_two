
import 'package:e_commerce/routes/routes.dart';
import 'package:e_commerce/view/Widgets/custom_snac_bar.dart';
import 'package:get/get.dart';



class ApiChecker {
  static void checkApi(Response response, {bool getXSnackBar = false}) {

    if(response.statusCode != 200){
      if(response.statusCode == 401) {
       // Get.find<AuthController>().clearSharedData();
        Get.offAllNamed(Routes.splashScreen);
      }else {
        showCustomSnackBar(response.statusText!, getXSnackBar: getXSnackBar);
      }

    }


  }
}