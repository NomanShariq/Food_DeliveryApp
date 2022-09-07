import 'package:get/get.dart';

class Dimension {
  static double screenHeight = Get.context!.height;
  static double screenWidth = Get.context!.width;

  static double pageview = screenHeight / 2.80;
  static double pageviewcontainer = screenHeight / 4.08;
  static double pageviewTextcontainer = screenHeight / 6.91;

  static double height10 = screenHeight / 89.9;
  static double height15 = screenHeight / 59.93;
  static double height20 = screenHeight / 44.95;
  static double height30 = screenHeight / 29.96;
  static double height45 = screenHeight / 19.97;

  // dynamic width margin padding
  static double width10 = screenHeight / 89.9;
  static double width15 = screenHeight / 59.93;
  static double width20 = screenHeight / 44.95;
  static double width30 = screenHeight / 29.96;

  // radius
  static double font20 = screenHeight / 44.95;
  static double radius10 = screenHeight / 89.9;
  static double radius15 = screenHeight / 59.9;
  static double radius20 = screenHeight / 44.9;
  static double radius30 = screenHeight / 29.9;

  //Icon size
  static double iconSize24 = screenHeight / 37.45;
  static double iconSize20 = screenHeight / 44.95;

  // list view image size
  static double listViewImgSize = screenHeight / 8.99;
  static double listViewTextSize = screenHeight / 8.99;

  //Deatil page img
  static double detailImgSize = screenHeight / 2.5;
}
