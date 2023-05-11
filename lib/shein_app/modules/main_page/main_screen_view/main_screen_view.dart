import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:shein_app/shein_app/modules/main_page/main_screen_contrlloer/main_screen_controller.dart';
import 'package:shein_app/shein_app/modules/main_page/main_screen_view/components/custom_bottom_nav_bar.dart';
import 'package:sizer/sizer.dart';

class MainScreenView extends GetView<MainScreenController> {
  MainScreenView({key});
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
                size: 30.sp,
              ),
              Expanded(
                child: Text(label.tr,
                    style: TextStyle(
                        fontSize: 10.sp,
                        color: isSelected ? Colors.black : Colors.grey[700],
                        fontWeight: FontWeight.bold)),
              ),
            ],
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: GetBuilder<MainScreenController>(
          init: MainScreenController(),
          builder: (controller) {
            return Container(
              height: 10.h,
              color: Colors.white,
              child: DefaultTabController(
                length: 4,
                child: TabBar(
                  indicatorColor: Colors.white,
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
                        isSelected: i == controller.currentIndex,
                      ),
                  ],
                ),
              ),
            );
          }),
      body: controller.list[controller.currentIndex],
    );
  }
}
