import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class DiscountRowTime extends StatelessWidget {
  const DiscountRowTime({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(1.h),
      child: Row(
        children: [
          Row(children: [
            Text("Discount Now"),
            Spacer(),
            Text("End at"),
            Container(
                color: Colors.black,
                child: Text("01", style: TextStyle(color: Colors.white))),
            Text(":"),
            Container(
                color: Colors.black,
                child: Text("01", style: TextStyle(color: Colors.white))),
            Text(":"),
            Container(
                color: Colors.black,
                child: Text("01", style: TextStyle(color: Colors.white))),
            Text(":")
          ]),
        ],
      ),
    );
  }
}
