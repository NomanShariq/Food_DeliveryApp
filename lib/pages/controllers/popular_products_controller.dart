import 'package:food_delivery_app/models/product_models.dart';
import 'package:food_delivery_app/pages/data/api/Repository/popular_products_repo.dart';
import 'package:get/get.dart';

class PopularProductsController extends GetxController {
  final PopularProductsRepo popularProductsRepo;
  PopularProductsController({required this.popularProductsRepo});

  List<dynamic> _popularProductslist = [];
  List<dynamic> get popularProductslist => _popularProductslist;

  Future<void> getpopularProductslist() async {
    Response response = await popularProductsRepo.getPopularProductsList();
    if (response.statusCode == 200) {
      print("got products");
      _popularProductslist = [];
      _popularProductslist.addAll(Product.fromJson(response.body).products);
      update();
    } else {}
  }
}
