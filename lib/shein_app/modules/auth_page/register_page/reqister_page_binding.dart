import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shein_app/shein_app/modules/auth_page/register_page/register_page_controoler.dart';
import 'package:shein_app/shein_app/modules/home_page/home_page_controller/home_page_controller.dart';

class RegisterBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(RegisterController());
  }
}
