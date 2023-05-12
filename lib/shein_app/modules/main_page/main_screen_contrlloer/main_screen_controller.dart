import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shein_app/shein_app/modules/caetogries_page/catogries_page_view/cateogries_view.dart';
import 'package:shein_app/shein_app/modules/home_page/home_page_vew/home_page_view.dart';

class MainScreenController extends GetxController {
  bool isSelected = false;
  var list = [
    HomePageView(),
    CateogriesPageView(),
    HomePageView(),
    HomePageView(),
  ];
  List<String> label = ["Home", "Cateogries", "New", "Profile"];
  List<String> icon = [
    "assets/h2.png",
    "assets/s1.png",
    "assets/d2.png",
    "assets/u1.png",
  ];
  List<String> icons = [
    "assets/h2.png",
    "assets/s1.png",
    "assets/d2.png",
    "assets/u1.png",
  ];
  int currentIndex = 0;
  changeCurrentIndex(value) {
    currentIndex = value;
    isSelected = true;
    update();
  }
}
