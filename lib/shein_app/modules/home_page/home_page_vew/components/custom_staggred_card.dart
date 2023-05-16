import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shein_app/shein_app/modules/home_page/home_page_controller/home_page_controller.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/utils/utils_widgets/rich_text.dart';
import '../../../../data/models/local_store.dart';

class CustomStaggredCard extends GetView<HomePageController> {
  LocalStores? category;
  CustomStaggredCard({key, this.category});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(1.h),
        child: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(5.sp)),
          child: Card(
            elevation: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    height: controller.isHeight == true ? 20.h : 26.h,
                    width: 25.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(5.sp),
                          topRight: Radius.circular(5.sp),
                          bottomLeft: Radius.circular(4.sp),
                          bottomRight: Radius.circular(4.sp),
                        ),
                        image: DecorationImage(
                          image: AssetImage(category!.image!),
                          fit: BoxFit.cover,
                        ))),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(1.h),
                      child: RichTextUtils(
                        text: '12',
                        textspan: '.05 \$',
                        fontSizeSpan: 7.sp,
                        fontSizeText: 13.sp,
                      ),
                      // child:

                      // Text(
                      //   "10.5",
                      //   style: TextStyle(
                      //       color: Colors.black,
                      //       fontWeight: FontWeight.bold,
                      //       fontSize: 13.sp),
                      // ),
                    ),
                    //  Spacer(),
                    Row(
                      children: const [
                        Text(
                          "woman T.shirt",
                          style: TextStyle(
                              color: Colors.grey, fontWeight: FontWeight.bold),
                        ),
                        Spacer(),
                        Icon(Icons.more_horiz)
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
