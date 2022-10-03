import 'package:food_delivery_app/pages/controllers/cart_controller.dart';
import 'package:food_delivery_app/pages/controllers/popular_products_controller.dart';
import 'package:food_delivery_app/pages/controllers/recommended_products_controller.dart';
import 'package:food_delivery_app/pages/data/api/Repository/cart_repo.dart';
import 'package:food_delivery_app/pages/data/api/Repository/popular_products_repo.dart';
import 'package:food_delivery_app/pages/data/api/Repository/recommended_products_repo.dart';
import 'package:food_delivery_app/pages/data/api/api_client.dart';
import 'package:food_delivery_app/utilis/app_constants.dart';
import 'package:get/get.dart';

Future<void> init() async {
  // api client
  Get.lazyPut(() => ApiClient(appBaseUrl: AppConstants.BASE_URL));

  // repository
  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => RecommendedProductRepo(apiClient: Get.find()));
  Get.lazyPut((() => CartRepo()));

  // controllers
  Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));
  Get.lazyPut(
      () => RecommendedProductsController(recommendedProductRepo: Get.find()));
  Get.lazyPut(() => CartController(cartRepo: Get.find()));
}
