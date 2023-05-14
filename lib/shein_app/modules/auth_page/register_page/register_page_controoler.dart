import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shein_app/shein_app/modules/auth_page/auth_page_view.dart';
import 'package:shein_app/shein_app/modules/main_page/main_screen_binding/main_screen_binding.dart';
import 'package:shein_app/shein_app/modules/main_page/main_screen_view/main_screen_view.dart';

import '../../../core/utils/utils_widgets/snack_bar_message.dart';
import '../../../data/data_source/auth/signup_data_source.dart';

class RegisterController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isshowpassword = true;
  var isLoading = false.obs;
  IconData? iconCVisiblity = Icons.visibility_off;
  IconData? iconVisiblity = Icons.visibility_off;
  bool ischecked = true;
  showPassword() {
    isshowpassword = !isshowpassword;
    // isshowpassword = isshowpassword == true ? false : true;

    iconVisiblity = isshowpassword ? Icons.visibility_off : Icons.visibility;
    update();
  }

  showCheckedPassword() {
    ischecked = !ischecked;

    iconCVisiblity = ischecked ? Icons.visibility_off : Icons.visibility;
    update();
  }

  //////////sign up method///////////
  Future createNewUser() async {
    if (formKey.currentState!.validate()) {
      try {
        isLoading.value = true;
        print(nameController.value.text);
        var data = await SignupData().postSignUpData(
            name: nameController.text,
            email: emailController.text,
            pasword: passwordController.text,
            confirmPassword: confirmPasswordController.text,
            registerby: "");
        print(data);

        if (data.data["result"] == true) {
          isLoading.value = false;
          showSnakBarMessage(
              msg: "Register Successfully", color: Colors.green[900]);
          print("Sucess register");
        } else {
          isLoading.value = false;
          print("not true");
        }
      } catch (error) {
        isLoading.value = false;
        print("some thing is error$error");
        showSnakBarMessage(
            msg: "OOp's..User already exists.", color: Colors.red[900]);
      }
    }
  }

  @override
  void onClose() {
    super.onClose();
  }
}
