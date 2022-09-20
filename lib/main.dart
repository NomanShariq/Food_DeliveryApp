import 'package:flutter/material.dart';
import 'package:food_delivery_app/pages/food/popular_food_detail.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'pages/food/recommended_food_detail.dart';
import 'pages/home/main_food_page.dart';
import './pages/helper/dependencies.dart' as dep;

Future<void> main() async {
  await dep.init(); 
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: RecommendedFoodDetail(),
    );
  }
}
