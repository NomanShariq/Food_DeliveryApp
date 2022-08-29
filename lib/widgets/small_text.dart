import 'package:flutter/material.dart';

class SmallText extends StatelessWidget {
  final String text;
  final Color? colour;
  double size;
  double height;
  SmallText(
      {Key? key,
      required this.text,
      this.colour = Colors.black54,
      this.size = 12,
      this.height = 2})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: colour,
        fontFamily: 'Raleway',
        fontSize: size,
        fontWeight: FontWeight.w600,
        height: height,
      ),
    );
  }
}
