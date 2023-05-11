import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shein_app/shein_app/modules/main_page/main_screen_contrlloer/main_screen_controller.dart';
import 'package:sizer/sizer.dart';

class CustomBottomNavigationBar extends GetView<MainScreenController> {
  const CustomBottomNavigationBar({key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          label: "Home",
          icon: ImageIcon(AssetImage("assets/home.png")),

          //  backgroundColor: Colors.green
        ),
        BottomNavigationBarItem(
          label: "Cateogries",
          icon: ImageIcon(AssetImage("assets/search1.png")),

          //  backgroundColor: Colors.green
        ),
        BottomNavigationBarItem(
          label: "New",
          icon: ImageIcon(
              AssetImage(
                "assets/dress.png",
              ),
              color: controller.isSelected ? Colors.black : Colors.grey),

          //  backgroundColor: Colors.green
        ),
        BottomNavigationBarItem(
          label: "Profile",
          icon: ImageIcon(
              AssetImage(
                "assets/user.png",
              ),
              color: controller.isSelected ? Colors.black : Colors.grey),

          //  backgroundColor: Colors.green
        ),
      ],
      type: BottomNavigationBarType.shifting,
      currentIndex: controller.currentIndex,
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.black45,
      iconSize: 50.sp,
      onTap: (value) => controller.changeCurrentIndex(value),
      elevation: 1,
    );
  }
}
