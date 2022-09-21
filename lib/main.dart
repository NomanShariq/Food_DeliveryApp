import 'package:flutter/material.dart';
import 'package:food_delivery_app/pages/controllers/popular_products_controller.dart';
import 'package:get/get.dart';
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
    Get.find<PopularProductsController>().getpopularProductslist();

    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainFoodPage(),
    );
  }
}
