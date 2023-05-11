import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shein_app/shein_app/modules/home_page/home_page_vew/home_page_view.dart';

class MainScreenController extends GetxController {
  bool isSelected = false;
  var list = [
    HomePageView(),
    HomePageView(),
    HomePageView(),
    HomePageView(),
  ];
  List<String> label = ["Home", "Cateogries", "New", "Profile"];
  List<String> icon = [
    "assets/home.png",
    "assets/s.png",
    "assets/dress.png",
    "assets/user.png",
  ];
  int currentIndex = 0;
  changeCurrentIndex(value) {
    currentIndex = value;
    isSelected = true;
    update();
  }
}
