import 'package:flutter/material.dart';
import 'package:food_delivery_app/widgets/big_text.dart';
import 'package:food_delivery_app/widgets/icon_and_text_widget.dart';
import 'package:food_delivery_app/widgets/small_text.dart';

class FoodPageBody extends StatelessWidget {
  const FoodPageBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PageController pageController = PageController(viewportFraction: 0.85);
    return Container(
      height: 320,
      child: PageView.builder(
          controller: pageController,
          itemCount: 5,
          itemBuilder: (context, position) {
            return _buildPagerItem(position);
          }),
    );
  }

  Widget _buildPagerItem(int index) {
    return Stack(
      children: [
        Container(
          height: 220,
          margin: EdgeInsets.only(
            left: 10,
            right: 10,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(
                "assets/image/foodpro2.jpg",
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 130,
            margin: EdgeInsets.only(left: 30, right: 30, bottom: 26),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(35),
              color: Colors.white,
            ),
            child: Container(
              padding: EdgeInsets.only(left: 22, right: 20, top: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BigText(text: "New York-Style Pizza."),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Wrap(
                        children: List.generate(
                            5,
                            (index) => Icon(
                                  Icons.star,
                                  color: Colors.cyan,
                                  size: 20,
                                )),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      SmallText(text: "4.5"),
                      SizedBox(
                        width: 10,
                      ),
                      SmallText(text: "1287"),
                      SizedBox(
                        width: 6,
                      ),
                      SmallText(text: "comments"),
                      SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        height: 40,
                      ),
                      IconAndText(
                          icon: Icons.circle_rounded,
                          iconColour: Color.fromARGB(255, 247, 194, 116),
                          text: "Normal"),
                      SizedBox(
                        width: 10,
                      ),
                      IconAndText(
                          icon: Icons.location_pin,
                          iconColour: Colors.cyan,
                          text: "1.7m"),
                      SizedBox(
                        width: 10,
                      ),
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
    );
  }
}
