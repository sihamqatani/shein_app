import 'package:flutter/material.dart';

class HeadlineText extends StatelessWidget {
  final String text;
  final double size;
  FontWeight? fontWeight;
  Color? color;
  HeadlineText(
      {key,
      this.color,
      required this.text,
      required this.size,
      required this.fontWeight});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(color: color, fontSize: size, fontWeight: fontWeight),
    );
  }
}
