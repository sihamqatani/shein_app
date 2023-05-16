import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class RichTextUtils extends StatelessWidget {
  String? text;
  String? textspan;
  Color? textColor;
  Colors? spanColor;
  FontSize
  const RichTextUtils({key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
          text: text!,
          style: TextStyle(color: Colors.black, fontSize: 18),
          children: <TextSpan>[
            TextSpan(
                text: ' Sign up',
                style: TextStyle(color: Colors.black, fontSize: 18),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    // navigate to desired screen
                  })
          ]),
    );
  }
}
