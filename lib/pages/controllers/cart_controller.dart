import 'package:food_delivery_app/models/product_models.dart';
import 'package:get/get.dart';
import '../../models/cart_model.dart';
import '../data/api/Repository/cart_repo.dart';

class CartController extends GetxController {
  final CartRepo cartRepo;
  CartController({required this.cartRepo});

  Map<int, CartModel> _items = {};

  Map<int, CartModel> get items => _items;

  void addItem(ProductModel product, int quantity) {
    if (quantity > 0) {
      _items.update(product.id!, (value) {
        return CartModel(
          id: value.id,
          name: value.name,
          price: value.price,
          img: value.img,
          quantity: value.quantity! + quantity,
          isExit: true,
          time: DateTime.now().toString(),
        );
      });
    }
    _items.putIfAbsent(product.id!, () {
      return CartModel(
        id: product.id,
        name: product.name,
        price: product.price,
        img: product.img,
        quantity: quantity,
        isExit: true,
        time: DateTime.now().toString(),
      );
    });
  }
}
