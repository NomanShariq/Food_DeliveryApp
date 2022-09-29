import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/models/product_models.dart';
import 'package:food_delivery_app/pages/controllers/popular_products_controller.dart';
import 'package:food_delivery_app/pages/controllers/recommended_products_controller.dart';
import 'package:food_delivery_app/pages/food/popular_food_detail.dart';
import 'package:food_delivery_app/utilis/app_constants.dart';

import 'package:food_delivery_app/utilis/dimensions.dart';
import 'package:food_delivery_app/widgets/app_column.dart';
import 'package:food_delivery_app/widgets/icon_and_text_widget.dart';
import 'package:food_delivery_app/widgets/small_text.dart';
import 'package:get/get.dart';

import '../../widgets/big_text.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({Key? key}) : super(key: key);

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  PageController pageController = PageController(viewportFraction: 0.85);
  var _currPageValue = 0.0;
  double _scaleFactor = 0.8;
  double _height = Dimension.pageviewcontainer;
  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currPageValue = pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      // slider
      GetBuilder<PopularProductController>(builder: (popularProducts) {
        return popularProducts.isLoaded
            ? GestureDetector(
                onTap: () {
                  Get.to(PopularFoodDetailPage());
                },
                child: Container(
                  height: Dimension.pageview,
                  child: PageView.builder(
                      controller: pageController,
                      itemCount: popularProducts.popularProductList.length,
                      itemBuilder: (context, position) {
                        return _buildPagerItem(position,
                            popularProducts.popularProductList[position]);
                      }),
                ),
              )
            : CircularProgressIndicator(
                color: Colors.cyan,
              );
      }),

      GetBuilder<PopularProductController>(builder: (popularProducts) {
        return DotsIndicator(
          dotsCount: popularProducts.popularProductList.isEmpty
              ? 1
              : popularProducts.popularProductList.length,
          position: _currPageValue,
          decorator: DotsDecorator(
            size: const Size.square(9.0),
            activeSize: const Size(18.0, 9.0),
            activeColor: Colors.cyan,
            activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)),
          ),
        );
      }),
      // dots
      SizedBox(
        height: Dimension.height20,
      ),
      // popilar text
      Container(
        margin: EdgeInsets.only(
          left: Dimension.width20,
        ),
        child: Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
          BigText(text: "Recommended"),
          SizedBox(
            width: Dimension.width10,
          ),
          Container(
            margin: EdgeInsets.only(bottom: 3),
            child: BigText(text: ".", colour: Colors.grey),
          ),
          SizedBox(
            width: Dimension.width10,
          ),
          SmallText(text: "Food pairing"),
        ]),
      ),
      // list of images and text
      GetBuilder<RecommendedProductsController>(builder: (popularProducts) {
        return popularProducts.isLoaded
            ? Container(
                height: 900,
                child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  // shrinkWrap: true,
                  itemCount: popularProducts.recommendedProductList.length,
                  itemBuilder: (
                    context,
                    index,
                  ) {
                    return Container(
                      margin: EdgeInsets.only(
                          left: Dimension.width20,
                          bottom: Dimension.height15,
                          right: Dimension.width20),
                      child: Row(
                        children: [
                          //image section
                          Container(
                            height: Dimension.listViewImgSize,
                            width: Dimension.listViewImgSize,
                            decoration: BoxDecoration(
                              color: Colors.white38,
                              borderRadius:
                                  BorderRadius.circular(Dimension.radius10),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                  AppConstants.BASE_URL +
                                      AppConstants.UPLOADS +
                                      popularProducts
                                          .recommendedProductList[index].img!,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              height: Dimension.listViewTextSize,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(Dimension.radius20),
                                  bottomRight:
                                      Radius.circular(Dimension.radius20),
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsets.only(
                                    left: Dimension.width10,
                                    right: Dimension.width10),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    BigText(
                                        text: popularProducts
                                            .recommendedProductList[index]
                                            .name!),
                                    SmallText(
                                        text: "All Pakistan Characteristics"),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        IconAndText(
                                            icon: Icons.circle_rounded,
                                            iconColour: Color.fromARGB(
                                                255, 247, 194, 116),
                                            text: "Normal"),
                                        IconAndText(
                                            icon: Icons.location_pin,
                                            iconColour: Colors.cyan,
                                            text: "1.7m"),
                                        IconAndText(
                                            icon: Icons.timelapse,
                                            iconColour: Colors.red,
                                            text: "32min")
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              )
            : CircularProgressIndicator();
      })
    ]);
  }

  Widget _buildPagerItem(int index, ProductModel popularProduct) {
    Matrix4 matrix = new Matrix4.identity();
    if (index == _currPageValue.floor()) {
      var currScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);

      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currPageValue.floor() + 1) {
      var currScale =
          _scaleFactor + (_currPageValue - index + 1) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currPageValue.floor() - 1) {
      var currScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else {
      var currScale = 0.8;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, _height * (1 - _scaleFactor) / 2, 1);
    }
    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          Container(
            height: Dimension.pageviewcontainer,
            margin: EdgeInsets.only(
              left: Dimension.width10,
              right: Dimension.width10,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimension.width20),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                  AppConstants.BASE_URL +
                      AppConstants.UPLOADS +
                      popularProduct.img!,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: Dimension.pageviewTextcontainer,
              margin: EdgeInsets.only(
                  left: Dimension.width30,
                  right: Dimension.width30,
                  bottom: Dimension.width30),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimension.width20),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    blurRadius: 5.0,
                    offset: Offset(0, 5), // changes position of shadow
                  ),
                  BoxShadow(
                    color: Colors.white,
                    offset: Offset(5, 0), // changes position of shadow
                  ),
                  BoxShadow(
                    color: Colors.white,
                    offset: Offset(-5, 0), // changes position of shadow
                  ),
                ],
              ),
              child: Container(
                padding: EdgeInsets.only(
                    top: Dimension.height10,
                    left: Dimension.width20,
                    right: Dimension.width20,
                    bottom: Dimension.width10),
                child: AppColumn(
                  text: popularProduct.name!,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
