import 'package:flutter/material.dart';
import 'package:food_delivery_app/utilis/dimensions.dart';
import 'package:food_delivery_app/widgets/app_icon.dart';

class PopularFoodDetailPage extends StatelessWidget {
  const PopularFoodDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            child: Container(
              width: double.infinity,
              height: Dimension.detailImgSize,
              decoration: BoxDecoration(
                  image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("assets/image/Prodetail.jpg"),
              )),
            ),
          ),
          Positioned(
            top: Dimension.height45,
            left: Dimension.width10,
            right: Dimension.width10,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(icon: Icons.arrow_back_ios_new),
                AppIcon(
                  icon: Icons.shopping_cart,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
