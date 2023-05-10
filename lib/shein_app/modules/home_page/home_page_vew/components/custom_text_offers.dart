import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomTextOffers extends StatelessWidget {
  const CustomTextOffers({key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 10.h,
      width: 12.h,
      // color: Colors.white,
      child: Column(children: [
        Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: .5.h, left: .5.w, right: .5.w),
                  child: Text(
                    "R10",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 1.h),
                  child: Container(
                    color: Colors.black,
                    height: 2.h,
                    width: 4.h,
                    child: Center(
                      child: Text(
                        " OFF",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 8.sp),
                      ),
                    ),
                  ),
                )
              ],
            )),
        const Text(
          "ORER Of 10",
          style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
        )
      ]),
    );
    ;
  }
}
