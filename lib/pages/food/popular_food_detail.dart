import 'package:flutter/material.dart';
import 'package:food_delivery_app/utilis/dimensions.dart';
import 'package:food_delivery_app/widgets/app_column.dart';
import 'package:food_delivery_app/widgets/app_icon.dart';
import 'package:food_delivery_app/widgets/expandable_text_widget.dart';

import '../../widgets/big_text.dart';

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
          Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              top: Dimension.detailImgSize - 10,
              child: Container(
                padding: EdgeInsets.only(
                    left: Dimension.width20,
                    right: Dimension.width20,
                    top: Dimension.height20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Dimension.radius15),
                    topRight: Radius.circular(Dimension.radius15),
                  ),
                  color: Colors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppColumn(text: "New-York Style Pizza"),
                    SizedBox(
                      height: Dimension.height20,
                    ),
                    BigText(text: "Introduce"),
                    SizedBox(
                      height: Dimension.height10,
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: ExpandableTextWidget(
                            text:
                                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book."),
                      ),
                    )
                  ],
                ),
              )),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(Dimension.radius20),
            topRight: Radius.circular(Dimension.radius20),
          ),
          color: Color.fromARGB(255, 237, 243, 237),
        ),
        padding: EdgeInsets.only(
            left: Dimension.width20,
            right: Dimension.width20,
            top: Dimension.height30,
            bottom: Dimension.height30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimension.radius15),
                color: Colors.white,
              ),
              padding: EdgeInsets.only(
                top: Dimension.height15,
                bottom: Dimension.height15,
                right: Dimension.width20,
                left: Dimension.width20,
              ),
              child: Row(
                children: [
                  Icon(Icons.remove),
                  SizedBox(
                    width: Dimension.width10,
                  ),
                  BigText(text: "0"),
                  SizedBox(
                    width: Dimension.width10,
                  ),
                  Icon(Icons.add),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                top: Dimension.height15,
                bottom: Dimension.height15,
                right: Dimension.width20,
                left: Dimension.width20,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimension.radius15),
                color: Colors.white,
              ),
              child: BigText(text: "\$10 | Add To Cart"),
            ),
          ],
        ),
      ),
    );
  }
}
