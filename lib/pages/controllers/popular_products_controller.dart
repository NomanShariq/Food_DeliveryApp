import 'package:flutter/material.dart';
import 'package:food_delivery_app/models/cart_model.dart';
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
      print("the items quantity is " + _quantity.toString());
    } else {
      _quantity = checkQuantity(_quantity - 1);
      print("decrement" + _quantity.toString());
    }
    update();
  }

  // product quantity check
  int checkQuantity(int quantity) {
    if ((_isInCart + quantity) < 0) {
      Get.snackbar("Add atleast 1", "Cant reduce less than 0");
      if (_isInCart > 0) {
        _quantity = -_isInCart;
        return _quantity;
      }
      return 0;
    } else if ((_isInCart + quantity) > 30) {
      Get.snackbar("No more add", "Cant add greater than 30");
      return 30;
    } else {
      return quantity;
    }
  }

  void addItem(ProductModel product) {
    _cart.addItem(product, _quantity);
    _quantity = 0;
    _isInCart = _cart.getQuantity(product);
    _cart.items.forEach((key, value) {
      print("id is " +
          value.id.toString() +
          "quantity is " +
          value.quantity.toString());
    });
    update();
  }

  void initProduct(
    ProductModel product,
    CartController cart,
  ) {
    _quantity = 0;
    _isInCart = 0;
    _cart = cart;
    var exist = false;
    exist = _cart.existInCart(product);

    // print("quantity of product is " + exist.toString());

    if (exist) {
      _isInCart = cart.getQuantity(product);
    }
    // print("the quantity of cart items is" + isInCart.toString());
  }

  int get totalItems {
    return _cart.totalItems;
  }

  List<CartModel> get getItems {
    return _cart.getItems;
  }
}
