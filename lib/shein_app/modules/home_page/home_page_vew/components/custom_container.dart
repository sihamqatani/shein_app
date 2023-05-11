import 'package:flutter/material.dart';
import 'package:shein_app/shein_app/data/models/local_store.dart';
import 'package:sizer/sizer.dart';

class CustomContainer extends StatelessWidget {
  LocalStores? cate;
  CustomContainer({key, this.cate});

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
            cate!.image!,
            color: Colors.black,
          ),
        ),
        Text(
          cate!.name!,
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        )
      ]),
    );
  }
}
