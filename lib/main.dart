import 'package:flutter/material.dart';
import 'package:food_delivery_app/pages/controllers/cart_controller.dart';
import 'package:food_delivery_app/pages/controllers/popular_products_controller.dart';
import 'package:food_delivery_app/pages/controllers/recommended_products_controller.dart';
import 'package:food_delivery_app/route/helper_routes.dart';
import 'package:get/get.dart';
import 'pages/cart/cart_page.dart';
import 'pages/home/main_food_page.dart';
import './pages/helper/dependencies.dart' as dep;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.find<PopularProductController>().getpopularProductList();
    Get.find<RecommendedProductsController>().getrecommendedProductList();
    Get.find<CartController>();
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // brightness: Brightness.dark,
        primarySwatch: Colors.blue,
      ),
      home: MainFoodPage(),
      // initialRoute: HelperRoute.initial,
      getPages: HelperRoute.routes,
    );
  }
}
