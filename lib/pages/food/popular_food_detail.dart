import 'package:flutter/material.dart';
import '../controllers/cart_controller.dart';
import '../controllers/popular_products_controller.dart';
import 'package:food_delivery_app/utilis/app_constants.dart';
import 'package:get/get.dart';
import 'package:food_delivery_app/pages/home/main_food_page.dart';
import 'package:food_delivery_app/utilis/dimensions.dart';
import 'package:food_delivery_app/widgets/app_column.dart';
import 'package:food_delivery_app/widgets/app_icon.dart';
import 'package:food_delivery_app/widgets/expandable_text_widget.dart';
import '../../widgets/big_text.dart';

class PopularFoodDetailPage extends StatelessWidget {
  final int pageId;
  const PopularFoodDetailPage({
    Key? key,
    required this.pageId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var product =
        Get.find<PopularProductController>().popularProductList[pageId];
    Get.find<PopularProductController>()
        .initProduct(Get.find<CartController>());
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
                  image: NetworkImage(
                    AppConstants.BASE_URL + AppConstants.UPLOADS + product.img!,
                  ),
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
                  GestureDetector(
                      onTap: () {
                        Get.to(MainFoodPage());
                      },
                      child: AppIcon(icon: Icons.arrow_back_ios_new)),
                  AppIcon(
                    icon: Icons.shopping_cart_rounded,
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
                      AppColumn(text: product.name!),
                      SizedBox(
                        height: Dimension.height20,
                      ),
                      BigText(text: "Introduce"),
                      SizedBox(
                        height: Dimension.height10,
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          child:
                              ExpandableTextWidget(text: product.description!),
                        ),
                      )
                    ],
                  ),
                )),
          ],
        ),
        bottomNavigationBar: GetBuilder<PopularProductController>(
          builder: (popularproduct) => Container(
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
                      GestureDetector(
                          onTap: () {
                            popularproduct.setQuantity(false);
                          },
                          child: Icon(Icons.remove)),
                      SizedBox(
                        width: Dimension.width10,
                      ),
                      BigText(text: popularproduct.quantity.toString()),
                      SizedBox(
                        width: Dimension.width10,
                      ),
                      GestureDetector(
                          onTap: () {
                            popularproduct.setQuantity(true);
                          },
                          child: Icon(Icons.add)),
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
                    color: Colors.cyan,
                  ),
                  child: GestureDetector(
                      onTap: () {
                        popularproduct.addItem(product);
                      },
                      child: BigText(
                        text: "\$${product.price} | Add To Cart",
                        colour: Colors.white,
                      )),
                ),
              ],
            ),
          ),
        ));
  }
}
