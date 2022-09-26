import 'package:food_delivery_app/pages/data/api/api_client.dart';
import 'package:food_delivery_app/utilis/app_constants.dart';
import 'package:get/get.dart';

class PopularProductRepo extends GetxService {
  final ApiClient apiClient;
  PopularProductRepo({required this.apiClient});

  Future<Response> getPopularProductList() async {
    return await apiClient.getData(AppConstants.POPULAR_PRODUCTS_URI);
  }
}
