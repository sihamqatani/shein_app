import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../data/models/local_store.dart';

class ShopByCateogrie extends StatelessWidget {
  LocalStores cateogreis;

  ShopByCateogrie({key, required this.cateogreis});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: Colors.grey[200],
          radius: 27.sp,
          child: CircleAvatar(
            radius: 20.sp,
            backgroundImage: AssetImage(cateogreis.image!),

            // cateogrries[index].image!) )),

            //  height: 8.h,
            //Image.asset(
            // cateogrries[index].image!)),
          ),
        ),
        Text(cateogreis.name!),
      ],
    );
  }
}
