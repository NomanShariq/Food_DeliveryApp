import 'package:flutter/material.dart';
import 'package:food_delivery_app/models/product_models.dart';
import 'package:food_delivery_app/pages/controllers/cart_controller.dart';
import 'package:food_delivery_app/pages/data/api/Repository/popular_products_repo.dart';
import 'package:get/get.dart';

class PopularProductController extends GetxController {
  final PopularProductRepo popularProductRepo;
  PopularProductController({required this.popularProductRepo});

  List<ProductModel> _popularProductList = [];
  List<ProductModel> get popularProductList => _popularProductList;
  late CartController _cart;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  int _quantity = 0;
  int get quantity => _quantity;

  int _isInCart = 0;
  int get isInCart => _isInCart + _quantity;

  Future<void> getpopularProductList() async {
    Response response = await popularProductRepo.getPopularProductList();
    if (response.statusCode == 200) {
      _popularProductList = [];
      _popularProductList.addAll(Product.fromJson(response.body).products);
      _isLoaded = true;
      update();
    } else {}
  }

  // product quantity
  void setQuantity(bool increment) {
    if (increment) {
      _quantity = checkQuantity(_quantity + 1);
    } else {
      _quantity = checkQuantity(_quantity - 1);
    }
    update();
  }

  // product quantity check
  int checkQuantity(int quantity) {
    if (quantity < 0) {
      Get.snackbar("Add atleast 1", "Cant reduce less than 0");
      return 0;
    } else if (quantity > 30) {
      Get.snackbar("No more add", "Cant add greater than 30");
      return 30;
    } else {
      return quantity;
    }
  }

  void addItem(ProductModel product) {
    if (_quantity > 0) {
      _cart.addItem(product, _quantity);
      _cart.items.forEach((key, value) {
        print("");
      });//dikhani hai print main id or quantity 
    } else {
      Get.snackbar("Cant add", "You have to add atleast 1 item in cart",
          backgroundColor: Colors.cyan, colorText: Colors.white);
    }
  }

  void initProduct(CartController cart) {
    _quantity = 0;
    _isInCart = 0;
    _cart = cart;
  }
}
