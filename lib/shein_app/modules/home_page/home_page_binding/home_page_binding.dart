import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shein_app/shein_app/modules/home_page/home_page_controller/home_page_controller.dart';

class HomePageBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(HomePageController());
  }
}
