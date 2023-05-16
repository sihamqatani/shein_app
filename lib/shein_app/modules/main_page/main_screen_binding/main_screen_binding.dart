import 'package:get/get.dart';
import 'package:shein_app/shein_app/modules/main_page/main_screen_contrlloer/main_screen_controller.dart';

class MainScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(MainScreenController(), permanent: true);
  }
}
