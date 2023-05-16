import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class RichTextUtils extends StatelessWidget {
  String? text;
  String? textspan;
  Color? textColor;
  Color? spanColor;

  double? fontSizeText;
  double? fontSizeSpan;

  RichTextUtils(
      {key,
      this.fontSizeSpan,
      this.fontSizeText,
      this.spanColor,
      this.text,
      this.textColor,
      this.textspan});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
          text: text!,
          style: TextStyle(
              color: textColor ?? Colors.black, fontSize: fontSizeText),
          children: <TextSpan>[
            TextSpan(
                text: textspan,
                style: TextStyle(
                    color: spanColor ?? Colors.black,
                    fontSize: fontSizeSpan,
                    fontWeight: FontWeight.w800),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    // navigate to desired screen
                  })
          ]),
    );
  }
}
