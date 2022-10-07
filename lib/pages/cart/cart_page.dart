import 'package:flutter/material.dart';
import 'package:food_delivery_app/pages/controllers/cart_controller.dart';
import 'package:food_delivery_app/pages/home/main_food_page.dart';
import 'package:food_delivery_app/utilis/dimensions.dart';
import 'package:food_delivery_app/widgets/app_icon.dart';
import 'package:food_delivery_app/widgets/big_text.dart';
import 'package:food_delivery_app/widgets/small_text.dart';
import 'package:get/get.dart';

import '../../utilis/app_constants.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: Dimension.height20 * 3,
            left: Dimension.width20,
            right: Dimension.width20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(
                  icon: Icons.arrow_back_ios_new,
                  iconsize: Dimension.iconSize24,
                  iconColour: Colors.white,
                  backgroundcolor: Colors.cyan,
                ),
                SizedBox(
                  width: Dimension.width20 * 5,
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(MainFoodPage());
                  },
                  child: AppIcon(
                    icon: Icons.home_outlined,
                    iconsize: Dimension.iconSize24,
                    iconColour: Colors.white,
                    backgroundcolor: Colors.cyan,
                  ),
                ),
                AppIcon(
                  icon: Icons.shopping_cart_outlined,
                  iconsize: Dimension.iconSize24,
                  iconColour: Colors.white,
                  backgroundcolor: Colors.cyan,
                ),
              ],
            ),
          ),
          Positioned(
              top: Dimension.height20 * 5,
              right: Dimension.width20,
              left: Dimension.width20,
              bottom: 0,
              child: Container(
                margin: EdgeInsets.only(top: Dimension.height15),
                child: MediaQuery.removePadding(
                  context: context,
                  removeTop: true,
                  child: Container(
                      // color: Colors.red,
                      child: GetBuilder<CartController>(builder: (controller) {
                    return ListView.builder(
                        itemCount: controller.getItems.length,
                        itemBuilder: ((_, index) {
                          return Container(
                            height: Dimension.height20 * 5,
                            width: double.maxFinite,
                            child: Row(
                              children: [
                                Container(
                                  height: Dimension.height45 * 5,
                                  width: Dimension.height20 * 5,
                                  margin:
                                      EdgeInsets.only(top: Dimension.height15),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(
                                        Dimension.width20),
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: NetworkImage(
                                          AppConstants.BASE_URL +
                                              AppConstants.UPLOADS +
                                              controller.getItems[index].img!,
                                        )),
                                  ),
                                ),
                                SizedBox(
                                  width: Dimension.width20,
                                ),
                                Expanded(
                                  child: Container(
                                      height: Dimension.height20 * 5,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          SizedBox(
                                            height: Dimension.height10,
                                          ),
                                          BigText(
                                              text: controller
                                                  .getItems[index].name
                                                  .toString()),
                                          SmallText(text: "Spicy"),
                                          Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                BigText(
                                                    text:
                                                        "\$ ${controller.getItems[index].price} "),
                                                Container(
                                                  height: Dimension.height30,
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            Dimension.radius10),
                                                  ),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      GestureDetector(
                                                          onTap: () {
                                                            // popularproduct.setQuantity(false);
                                                          },
                                                          child: Icon(
                                                              Icons.remove)),
                                                      SizedBox(
                                                        width:
                                                            Dimension.width10,
                                                      ),
                                                      BigText(text: "0"),
                                                      SizedBox(
                                                        width:
                                                            Dimension.width10,
                                                      ),
                                                      GestureDetector(
                                                          onTap: () {
                                                            // popularproduct.setQuantity(true);
                                                          },
                                                          child:
                                                              Icon(Icons.add)),
                                                    ],
                                                  ),
                                                ),
                                              ]),
                                        ],
                                      )),
                                )
                              ],
                            ),
                          );
                        }));
                  })),
                ),
              ))
        ],
      ),
    );
  }
}
