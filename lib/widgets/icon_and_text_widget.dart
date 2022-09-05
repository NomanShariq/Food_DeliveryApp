import 'package:flutter/material.dart';
import 'package:food_delivery_app/utilis/dimensions.dart';
import 'package:food_delivery_app/widgets/small_text.dart';

class IconAndText extends StatelessWidget {
  final IconData icon;
  final Color iconColour;
  final String text;

  IconAndText(
      {Key? key,
      required this.icon,
      required this.iconColour,
      required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: iconColour,
          size: Dimension.iconSize20,
        ),
        SizedBox(
          width: 2,
        ),
        SmallText(text: text),
      ],
    );
  }
}
