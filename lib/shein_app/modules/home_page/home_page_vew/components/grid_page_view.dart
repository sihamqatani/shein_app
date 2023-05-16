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
              borderRadius: BorderRadius.circular(1.h),
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(
                  cateogreis.image!,
                ),
              ))
          // cateogrries[index].image!) )),
          ,
          height: 8.5.h,
          //Image.asset(
          // cateogrries[index].image!)),
        ),
        Text(cateogreis.name!),
      ],
    );
  }
}
