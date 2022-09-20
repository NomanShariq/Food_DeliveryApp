import 'package:food_delivery_app/pages/data/api/Repository/popular_products_repo.dart';
import 'package:get/get.dart';

class PopularProductsController extends GetxController {
  final PopularProductsRepo popularProductsRepo;
  PopularProductsController({required this.popularProductsRepo});

  List<dynamic> _popularproductslist = [];
  List<dynamic> get popularproductslist => _popularproductslist;

  Future<void> getpopularProductslist() async {
    Response response = await popularProductsRepo.getPopularProductsList();
    if (response.statusCode == 200) {
      _popularproductslist = [];
      // _popularproductslist.addAll();
      update();
    } else {}
  }
}
