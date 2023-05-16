import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/utils/theme/app_color.dart';

class OffersContainer extends StatelessWidget {
  const OffersContainer({key});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Center(
          child: DefaultTextStyle(
              style: TextStyle(
                fontSize: 14.sp,
                color: Colors.white,
                fontWeight: FontWeight.bold,
                shadows: [
                  Shadow(
                    blurRadius: 5.0,
                    color: Colors.white,
                    offset: Offset(0, 0),
                  ),
                ],
              ),
              child: AnimatedTextKit(
                isRepeatingAnimation: true,
                animatedTexts: [
                  FlickerAnimatedText('Buy 2 get 1 of them 50% OFF'),
                  FlickerAnimatedText('Buy 1 get 1 of them 20% OFF'),
                ],
              )),
        ),
        height: 6.h,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Colors.orange[700]!,
                Colors.red,
              ]),
        ));
  }
}
