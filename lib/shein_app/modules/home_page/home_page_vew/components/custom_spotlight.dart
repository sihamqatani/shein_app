import 'package:flutter/material.dart';
import 'package:shein_app/shein_app/core/utils/theme/app_color.dart';
import 'package:shein_app/shein_app/data/models/local_store.dart';
import 'package:sizer/sizer.dart';

class CustomSpotLight extends StatelessWidget {
  Color? firstColor;
  final String text;
  Color? secondColor;
  LocalStores? localStores;
  CustomSpotLight(
      {key,
      this.localStores,
      this.firstColor,
      this.secondColor,
      required this.text});

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
              alignment: Alignment.bottomCenter,
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
                Container(
                    height: 5.h,
                    width: 15.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(1.h),
                        gradient: LinearGradient(
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                            colors: [
                              firstColor ?? Colors.orange[700]!,
                              secondColor ?? Colors.red,
                            ])),
                    child: Center(
                        child: Text(
                      text,
                      style: TextStyle(
                          color: ColorManager.primary,
                          fontWeight: FontWeight.w600),
                    ))),
              ],
            ),
          ],
        ));
  }
}
