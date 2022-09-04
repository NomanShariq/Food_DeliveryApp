import 'package:flutter/material.dart';
import 'package:food_delivery_app/utilis/dimensions.dart';

class BigText extends StatelessWidget {
  final String text;
  final Color? colour;
  double size;
  TextOverflow overflow;
  BigText(
      {Key? key,
      required this.text,
      this.colour = Colors.black,
      this.overflow = TextOverflow.ellipsis,
      this.size = 0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      overflow: overflow,
      style: TextStyle(
        color: colour,
        fontFamily: 'Raleway',
        fontSize: size == 0 ? Dimension.font20 : size,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
