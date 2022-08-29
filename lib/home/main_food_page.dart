import 'package:flutter/material.dart';
import 'package:food_delivery_app/home/food_page_body.dart';
import 'package:food_delivery_app/widgets/big_text.dart';
import 'package:food_delivery_app/widgets/small_text.dart';

class MainFoodPage extends StatefulWidget {
  MainFoodPage({Key? key}) : super(key: key);

  @override
  State<MainFoodPage> createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Container(
            margin: EdgeInsets.only(top: 45, bottom: 45),
            padding: EdgeInsets.only(left: 15, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    BigText(
                      text: "Pakistan",
                      colour: Colors.cyan,
                    ),
                    Row(
                      children: [
                        SmallText(
                          text: "Karachi",
                          colour: Colors.black,
                        ),
                        Icon(Icons.arrow_drop_down)
                      ],
                    )
                  ],
                ),
                Center(
                  child: Container(
                    child: Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                    width: 45,
                    height: 45,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      color: Colors.cyan,
                    ),
                  ),
                ),
              ],
            )),
        const FoodPageBody(),
      ],
    ));
  }
}
