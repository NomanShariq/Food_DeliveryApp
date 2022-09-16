import 'package:flutter/material.dart';

import '../utilis/dimensions.dart';
import 'big_text.dart';
import 'icon_and_text_widget.dart';
import 'small_text.dart';

class AppColumn extends StatelessWidget {
  String text;
  AppColumn({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BigText(text: text),
        SizedBox(
          height: Dimension.height10,
        ),
        Row(
          children: [
            Wrap(
              children: List.generate(
                  5,
                  (index) => Icon(
                        Icons.star,
                        color: Colors.cyan,
                        size: Dimension.iconSize20,
                      )),
            ),
            SizedBox(
              width: Dimension.width10,
            ),
            SmallText(text: "4.5"),
            SizedBox(
              width: Dimension.width10,
            ),
            SmallText(text: "1287"),
            SizedBox(
              width: 6,
            ),
            SmallText(text: "comments"),
            SizedBox(
              height: Dimension.height45,
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconAndText(
                icon: Icons.circle_rounded,
                iconColour: Color.fromARGB(255, 247, 194, 116),
                text: "Normal"),
            IconAndText(
                icon: Icons.location_pin,
                iconColour: Colors.cyan,
                text: "1.7m"),
            IconAndText(
                icon: Icons.timelapse, iconColour: Colors.red, text: "32min")
          ],
        )
      ],
    );
  }
}
