import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomContactRow extends StatelessWidget {
  String? text;
  CustomContactRow({Key? key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(1.h),
      child: Row(
        children: [
          Text(
            text!,
            style:
                TextStyle(color: Colors.black54, fontWeight: FontWeight.bold),
          ),
          Spacer(),
          Icon(
            Icons.arrow_forward_ios,
            color: Colors.black54,
            size: 15.sp,
          )
        ],
      ),
    );
  }
}
