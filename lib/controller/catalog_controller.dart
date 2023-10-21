import 'package:get/get.dart';

class CatalogController extends GetxController{
      List<String> catagoryList=[
        "T-shirts",
        "Crop tops",
        "Sleeveless",
        "Shirts"
      ];

      var selectSort=(-0).obs;

      List<String> sortList=[
        "Popular",
        "Newest",
        "Customer review",
        "Price: lowest to high",
        "Price: highest to low",
      ];



}