import 'package:food_delivery_app/pages/controllers/popular_products_controller.dart';
import 'package:food_delivery_app/pages/data/api/Repository/popular_products_repo.dart';
import 'package:food_delivery_app/pages/data/api/api_client.dart';
import 'package:food_delivery_app/utilis/app_constants.dart';
import 'package:get/get.dart';

Future<void> init() async {
  // api client
  Get.lazyPut(() => ApiClient(appBaseUrl: AppConstants.BASE_URL));

  // repository
  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));

  // conmtrollers
  Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));

}
