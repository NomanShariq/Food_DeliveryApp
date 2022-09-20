import 'package:food_delivery_app/pages/controllers/popular_products_controller.dart';
import 'package:food_delivery_app/pages/data/api/Repository/popular_products_repo.dart';
import 'package:food_delivery_app/pages/data/api/api_client.dart';
import 'package:get/get.dart';

Future<void> init() async {
  // api client
  Get.lazyPut(() => ApiClient(appBaseUrl: "https://dbstech.com"));

  // repository
  Get.lazyPut(() => PopularProductsRepo(apiClient: Get.find()));

  // conmtrollers
  Get.lazyPut(() => PopularProductsController(popularProductsRepo: Get.find()));
}
