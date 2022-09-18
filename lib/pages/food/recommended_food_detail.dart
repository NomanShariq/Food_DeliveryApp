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
            backgroundColor: Color.fromARGB(255, 214, 100, 24),
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
                        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen bookLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.Lorem Ipsum is simply dum unknown printer took a galley of type and scrambled it to make a type specimen book.text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book..")),
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
                    size: Dimension.font16 * 2, text: "\$23.00" + "X" + "0"),
                AppIcon(
                  icon: Icons.add,
                  iconsize: Dimension.iconSize24,
                  backgroundcolor: Colors.cyan,
                  iconColour: Colors.white,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
