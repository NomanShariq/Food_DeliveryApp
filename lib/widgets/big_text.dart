import 'package:flutter/material.dart';

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
      this.size = 20})
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
        fontSize: size,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
