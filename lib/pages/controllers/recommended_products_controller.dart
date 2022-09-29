import 'package:food_delivery_app/models/product_models.dart';
import 'package:get/get.dart';

import '../data/api/Repository/recommended_products_repo.dart';

class RecommendedProductsController extends GetxController {
  final RecommendedProductRepo recommendedProductRepo;
  RecommendedProductsController({required this.recommendedProductRepo});

  List<ProductModel> _recommendedProductList = [];
  List<ProductModel> get recommendedProductList => _recommendedProductList;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  Future<void> getrecommendedProductList() async {
    Response response =
        await recommendedProductRepo.getRecommendedProductList();
    if (response.statusCode == 200) {
      print("got recommended products");
      _recommendedProductList = [];
      _recommendedProductList.addAll(Product.fromJson(response.body).products);
      _isLoaded = true;
      update();
    } else {}
  }
}
