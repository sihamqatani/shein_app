import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shein_app/shein_app/modules/auth_page/auth_page_view.dart';
import 'package:shein_app/shein_app/modules/caetogries_page/catogries_page_view/cateogries_view.dart';
import 'package:shein_app/shein_app/modules/home_page/home_page_vew/components/icon_painters/new_home.dart';
import 'package:shein_app/shein_app/modules/home_page/home_page_vew/home_page_view.dart';
import 'package:shein_app/shein_app/modules/home_page/sliverscaffold.dart';
import 'package:shein_app/shein_app/modules/main_page/main_screen_view/main_screen_view.dart';

class MainScreenController extends GetxController {
  // bool isSelected = false;
  var list = [
    // SliverScaffold(),
    // NewHomePage(),
    HomePageView(),
    // Container(
    //   color: Colors.redAccent,
    // ),
    //Container(),
    CateogriesPageView(),
    // HomePageView(),
    Container(),
    Container(),

    //AuthPageView(),
  ];
  List<String> label = ["Home", "Cateogries", "New", "Profile"].obs;
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
  var currentIndex = 0.obs;
  changeCurrentIndex(value) {
    currentIndex.value = value;
    // isSelected = true;
    update();
  }
}
