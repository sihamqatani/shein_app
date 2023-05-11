import 'package:flutter/material.dart';
import 'package:shein_app/shein_app/data/models/local_store.dart';
import 'package:sizer/sizer.dart';

class ProductCard extends StatelessWidget {
  int? switchy = 1;
  LocalStores? localStores;
  String? image;
  Color? background, containerColor;

  double? width;
  ProductCard(
      {key,
      this.width,
      this.background,
      this.image,
      this.localStores,
      this.switchy});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(1.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              // fit: StackFit.loose,
              alignment: Alignment.topLeft,
              children: [
                Container(
                    height: 20.h,
                    width: 15.h,
                    decoration: BoxDecoration(
                        // borderRadius: BorderRadius.only(
                        //     topLeft: Radius.circular(15.sp),
                        //     topRight: Radius.circular(15.sp)),
                        image: DecorationImage(
                      image: AssetImage(localStores!.image!),
                      fit: BoxFit.fill,
                    ))),
                switchy == 1
                    ? Container(
                        height: 5.h,
                        width: 4.h,
                        color: Colors.yellow,
                        child: Column(
                          children: [
                            Image.asset("assets/lighting.png"),
                            Text("3%")
                          ],
                        ))
                    : Padding(
                        padding: EdgeInsets.only(top: 1.h),
                        child: Container(
                            height: 3.h,
                            width: 5.h,
                            color: Colors.black,
                            child: Center(
                              child: Text(
                                "3%",
                                style: TextStyle(color: Colors.white),
                              ),
                            )),
                      ),
              ],
            ),
            Column(
              children: [
                Text(
                  "10.5",
                  style:
                      TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                ),
                Text(
                  "12.5",
                  style: TextStyle(
                      decoration: TextDecoration.lineThrough,
                      color: Colors.grey,
                      fontWeight: FontWeight.bold),
                ),
              ],
            )
          ],
        ));
  }
}
