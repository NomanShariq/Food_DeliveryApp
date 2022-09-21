import 'package:food_delivery_app/pages/data/api/api_client.dart';
import 'package:food_delivery_app/utilis/app_constants.dart';
import 'package:get/get.dart';

class PopularProductsRepo extends GetxService {
  final ApiClient apiClient;
  PopularProductsRepo({required this.apiClient});

  Future<Response> getPopularProductsList() async {
    return await apiClient.getData(APP_CONSTANTS.POPULAR_PRODUCTS_URL);
  }
}
