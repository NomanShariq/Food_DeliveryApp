import 'package:flutter/material.dart';
import 'package:food_delivery_app/pages/controllers/recommended_products_controller.dart';
import 'package:food_delivery_app/route/helper_routes.dart';
import 'package:food_delivery_app/utilis/app_constants.dart';
import 'package:food_delivery_app/utilis/dimensions.dart';
import 'package:food_delivery_app/widgets/app_icon.dart';
import 'package:food_delivery_app/widgets/big_text.dart';
import 'package:food_delivery_app/widgets/expandable_text_widget.dart';
import 'package:get/get.dart';

import '../cart/cart_page.dart';
import '../controllers/cart_controller.dart';
import '../controllers/popular_products_controller.dart';

class RecommendedFoodDetail extends StatelessWidget {
  final int pageId;
  const RecommendedFoodDetail({Key? key, required this.pageId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var product = Get.find<RecommendedProductsController>()
        .recommendedProductList[pageId];
    Get.find<PopularProductController>()
        .initProduct(product, Get.find<CartController>());
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            toolbarHeight: 80,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                    onTap: () {
                      Get.toNamed(HelperRoute.getInitial);
                    },
                    child: AppIcon(icon: Icons.arrow_back_ios_new)),
                GetBuilder<PopularProductController>(builder: ((controller) {
                  return Stack(
                    children: [
                      GestureDetector(
                          onTap: () {
                            if (controller.totalItems >= 1) {
                              Get.toNamed(HelperRoute.getCartPage());
                            }
                          },
                          child: AppIcon(icon: Icons.shopping_cart_outlined)),
                      controller.totalItems >= 1
                          ? Positioned(
                              right: 0,
                              top: 0,
                              child: AppIcon(
                                icon: Icons.circle,
                                iconColour: Colors.transparent,
                                backgroundcolor: Colors.cyan,
                                size: 19,
                              ),
                            )
                          : Container(),
                      Positioned(
                        right: 2,
                        top: 0,
                        child: BigText(
                          text: Get.find<PopularProductController>()
                              .totalItems
                              .toString(),
                          // text: controller.totalItems.toString(),
                          size: 14,
                        ),
                      )
                    ],
                  );
                }))
              ],
            ),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(20),
              child: Container(
                padding: EdgeInsets.only(
                    bottom: Dimension.height10, top: Dimension.height10),
                color: Colors.white,
                child: Center(child: BigText(text: product.name!)),
              ),
            ),
            pinned: true,
            backgroundColor: Color.fromARGB(245, 235, 121, 80),
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
                background: Image.network(
              AppConstants.BASE_URL + AppConstants.UPLOADS + product.img!,
              width: double.maxFinite,
              fit: BoxFit.cover,
            )),
          ),
          SliverToBoxAdapter(
            child: Container(
                padding: EdgeInsets.only(
                    left: Dimension.width20,
                    right: Dimension.width20,
                    top: Dimension.height10),
                child: ExpandableTextWidget(text: product.description!)),
          ),
        ],
      ),
      bottomNavigationBar: GetBuilder<PopularProductController>(
        builder: (controller) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: EdgeInsets.only(
                    left: Dimension.width20 * 2.5,
                    right: Dimension.width20 * 2.5,
                    top: Dimension.height10,
                    bottom: Dimension.height15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        controller.setQuantity(false);
                      },
                      child: AppIcon(
                        icon: Icons.remove,
                        iconsize: Dimension.iconSize24,
                        backgroundcolor: Colors.cyan,
                        iconColour: Colors.white,
                      ),
                    ),
                    BigText(
                        size: Dimension.font16 * 2,
                        text: " \$ ${product.price} "
                            " X "
                            " ${controller.isInCart} "),
                    GestureDetector(
                      onTap: () {
                        controller.setQuantity(true);
                      },
                      child: AppIcon(
                        icon: Icons.add,
                        iconsize: Dimension.iconSize24,
                        backgroundcolor: Colors.cyan,
                        iconColour: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
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
                      child: Icon(
                        Icons.favorite,
                        color: Colors.cyan,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        controller.addItem(product);
                      },
                      child: Container(
                        padding: EdgeInsets.only(
                          top: Dimension.height15,
                          bottom: Dimension.height15,
                          right: Dimension.width20,
                          left: Dimension.width20,
                        ),
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(Dimension.radius15),
                          color: Colors.white,
                        ),
                        child:
                            BigText(text: "\$ ${product.price} | Add To Cart"),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
