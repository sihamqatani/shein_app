import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:shein_app/shein_app/core/utils/theme/app_color.dart';
import 'package:shein_app/shein_app/modules/main_page/main_screen_contrlloer/main_screen_controller.dart';
import 'package:shein_app/shein_app/modules/main_page/main_screen_view/components/custom_bottom_nav_bar.dart';
import 'package:sizer/sizer.dart';

class MainScreenView extends GetWidget<MainScreenController> {
  MainScreenView({key});
  //Get.put(MainScreenController());
  TabController? cont;
  Widget tabItem(String path, String label, {bool isSelected = false}) {
    Get.put(MainScreenController());
    // Get.put(LanguageController());
    return AnimatedContainer(
        height: 10.h,
        width: 46.w,
        margin: EdgeInsets.only(
          top: 2.h,
        ),
        alignment: Alignment.center,
        duration: const Duration(milliseconds: 500),
        decoration: !isSelected
            ? null
            : BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                // color: myOrange,
              ),
        //padding: EdgeInsets.all(1.h),
        child: Center(
          child: Column(
            children: [
              ImageIcon(
                AssetImage(path),
                color: isSelected ? Colors.black : Colors.grey[700],
              ),
              Text(label,
                  style: TextStyle(
                      fontSize: 5.6.sp,
                      color: isSelected ? Colors.black : Colors.grey[700],
                      fontWeight: FontWeight.bold)),
            ],
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () =>
          // Get.put(LanguageController());
          Scaffold(
        extendBody: true,
        backgroundColor: ColorManager.primary,
        bottomNavigationBar:
            // Container(
            //   height: 8.h,
            //   width: 45.w,
            //   decoration: BoxDecoration(borderRadius: BorderRadius.circular(70)),
            Container(
                height: 10.h,
                width: 15.w,
                padding: EdgeInsets.only(
                  bottom: 1.w,
                ),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(30.0),
                    child: Container(
                      color: Colors.grey[100],
                      child: DefaultTabController(
                        length: controller.list.length,
                        // onTap: ((value) => controller.changCurrentIndex(value)),
                        // controller: cont,
                        child: TabBar(
                          onTap: ((value) {
                            // Get.find<LanguageController>();
                            controller.changeCurrentIndex(value);
                          }),
                          controller: cont,
                          tabs: [
                            for (int i = 0; i < controller.icon.length; i++)
                              tabItem(
                                controller.icon[i],
                                controller.label[i],
                                isSelected: i == controller.currentIndex.value,
                              ),
                          ],
                        ),
                      ),
                    ))),
        body: controller.list[controller.currentIndex.value],
      ),
    );
  }
}
