import 'package:flutter/material.dart';
import 'package:shein_app/shein_app/data/models/local_store.dart';
import 'package:sizer/sizer.dart';

class GridPageView extends StatelessWidget {
  LocalStores cateogreis;

  GridPageView({key, required this.cateogreis});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.h),
              image: DecorationImage(
                image: AssetImage(cateogreis.image!),
              ))
          // cateogrries[index].image!) )),
          ,
          height: 8.h,
          //Image.asset(
          // cateogrries[index].image!)),
        ),
        Text(cateogreis.name!),
      ],
    );
  }
}
