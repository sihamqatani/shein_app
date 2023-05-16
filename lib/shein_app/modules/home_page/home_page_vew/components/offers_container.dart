import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/utils/theme/app_color.dart';

class OffersContainer extends StatelessWidget {
  const OffersContainer({key});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Center(
            child: Text(
          "Buy 2 get 1 of them 50% OFF",
          style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.bold,
              color: ColorManager.primary),
        )),
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
