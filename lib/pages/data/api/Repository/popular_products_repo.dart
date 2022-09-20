import 'package:food_delivery_app/pages/data/api/api_client.dart';
import 'package:get/get.dart';

class PopularProductsRepo extends GetxService {
  final ApiClient apiClient;
  PopularProductsRepo({required this.apiClient});

  Future<Response> getPopularProductsList() async {
    return await apiClient.getData("https:///www.dbstech.com/api/products/list");
  }
}
