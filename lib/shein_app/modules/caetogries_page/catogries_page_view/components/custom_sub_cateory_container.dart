import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shein_app/shein_app/modules/caetogries_page/cateogries_page_controller/cateogries_page_controller.dart';
import 'package:sizer/sizer.dart';

class SubCateogryContainer extends GetView<CateogriesController> {
  int? x;
  String? name;
  int? idCat;

  SubCateogryContainer({key, this.x, this.name, this.idCat});

  @override
  Widget build(BuildContext context) {
    //Get.put(());
    return InkWell(
      onTap: () {
        controller.getSelected(x);
        // controller.getProductsByCateogrries(2, 1);
      },
      child: Obx(
        () => InkWell(
          onTap: () {
            controller.getSelected(x);
            controller.getCatogryById(idCat);
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            decoration: BoxDecoration(
                //borderRadius: BorderRadius.circular(15),
                color:
                    controller.selected == x ? Colors.black : Colors.grey[300]),
            height: controller.selected == x ? 9.h : 7.h,
            width: controller.selected == x ? 9.h : 7.h,
            // alignment: controller.selected == x
            //     ? Alignment(-1.0, -1.0)
            //     : Alignment(1.0, 1.0),
            child: Center(
              child: Padding(
                padding: EdgeInsets.all(1.h),
                child: Text(
                  name!,
                  textDirection: TextDirection.rtl,
                  style: TextStyle(
                      color: controller.selected == x
                          ? Colors.white
                          : Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 10.sp),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
