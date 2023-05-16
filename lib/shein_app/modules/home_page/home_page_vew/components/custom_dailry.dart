import 'package:flutter/material.dart';
import 'package:shein_app/shein_app/core/utils/utils_widgets/rich_text.dart';
import 'package:shein_app/shein_app/data/models/local_store.dart';
import 'package:sizer/sizer.dart';

class DairlyDrop extends StatelessWidget {
  int? switchy = 1;
  LocalStores? localStores;
  String? image;
  Color? background, containerColor;

  double? width;
  DairlyDrop(
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
            RichTextUtils(
              text: '12.',
              textspan: '05 \$',
              fontSizeSpan: 6.sp,
              fontSizeText: 9.sp,
            )
            // Text(
            //   "12.5\$",
            //   style:
            //       TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            // )
          ],
        ));
  }
}
