import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePageController extends GetxController {
  PageController curnnetPage = PageController();
  int currentIndex = 0;
  changeCurrentIndex(value) {
    currentIndex = value;
    update();
  }
}
