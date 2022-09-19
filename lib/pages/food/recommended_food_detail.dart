import 'package:flutter/material.dart';
import 'package:food_delivery_app/main.dart';
import 'package:food_delivery_app/utilis/dimensions.dart';
import 'package:food_delivery_app/widgets/app_icon.dart';
import 'package:food_delivery_app/widgets/big_text.dart';
import 'package:food_delivery_app/widgets/expandable_text_widget.dart';

class RecommendedFoodDetail extends StatefulWidget {
  RecommendedFoodDetail({Key? key}) : super(key: key);

  @override
  State<RecommendedFoodDetail> createState() => _RecommendedFoodDetailState();
}

class _RecommendedFoodDetailState extends State<RecommendedFoodDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            toolbarHeight: 80,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.clear),
                Icon(Icons.shopping_cart),
              ],
            ),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(20),
              child: Container(
                padding: EdgeInsets.only(
                    bottom: Dimension.height10, top: Dimension.height10),
                color: Colors.white,
                child: Center(child: BigText(text: "New-York Style Pizza")),
              ),
            ),
            pinned: true,
            backgroundColor: Color.fromARGB(245, 235, 121, 80),
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
                background: Image.asset(
              "assets/image/Prodetail.jpg",
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
                child: ExpandableTextWidget(
                    text:
                        "Pizza is one of the most sought-after dishes of Italian cuisine and is one of the easy dishes that you can prepare at home for your loved ones. The only setback is - making the perfect pizza base. Not everyone can make it. However, in this easy recipe, we give you step-by-step details on how to make a pizza using the fresh pizza base. Though you can buy a pizza base from the nearest superstore or market, the real taste of a pizza will only come when you make a fresh pizza. Also, another thing about pizza making is that you need to bake it at the right temperature and under the right conditions. So, if you are all set to make the pizza at home, here is an easy recipe that will guide you to prepare that perfect pizza. All you need to prepare the simplest Pizza at home is all-purpose flour, dry yeast, warm water, onion, tomato, capsicum, and different kinds of cheese along with tomato ketchup. Here, in this Italian recipe, we have used mushrooms as well, which is a subjective choice. You can also add any other vegetable of your liking to the pizza. This dish is one of the most versatile dishes, in which you can use any of your favourite veggies. This cheesy delight can be served on occasions like kitty party, potluck and even game night. If you have a party planned at home, then it's the easiest dish to prepare. Before serving, sprinkle some oregano and red chillies over the pizza and enjoy with tomato ketchup.")),
          ),
        ],
      ),
      bottomNavigationBar: Column(
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
                AppIcon(
                  icon: Icons.remove,
                  iconsize: Dimension.iconSize24,
                  backgroundcolor: Colors.cyan,
                  iconColour: Colors.white,
                ),
                BigText(
                    size: Dimension.font16 * 2,
                    text: " \$23.00 " + " X " + " 0 "),
                AppIcon(
                  icon: Icons.add,
                  iconsize: Dimension.iconSize24,
                  backgroundcolor: Colors.cyan,
                  iconColour: Colors.white,
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
        ],
      ),
    );
  }
}
