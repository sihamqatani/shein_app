import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 8.h,
      width: 17.h,
      color: Colors.grey[300],
      child: Column(children: [
        Padding(
          padding: EdgeInsets.all(1.h),
          child: Image.asset(
            "assets/calendar.png",
            color: Colors.black,
          ),
        ),
        const Text(
          "cart",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        )
      ]),
    );
  }
}
