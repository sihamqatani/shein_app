import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shein_app/shein_app/modules/auth_page/login_page/login_page_controller.dart';
import 'package:sizer/sizer.dart';

import '../../../core/utils/theme/app_color.dart';
import '../components/custom_auth_text_field.dart';
import '../components/custom_button.dart';

class LoginPageView extends GetView<LoginPageController> {
  const LoginPageView({key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(2.h),
      children: [
        Padding(
          padding: EdgeInsets.all(1.h),
          child: MyAuthTextField(
              controller: controller.emailController,
              type: TextInputType.emailAddress,
              obcure: false,
              label: "Name"),
        ),
        Padding(
          padding: EdgeInsets.all(1.h),
          child: MyAuthTextField(
              controller: controller.passwordController,
              type: TextInputType.visiblePassword,
              obcure: true,
              label: "Email or Phone number"),
        ),
        BlackButton(
            title: Text("Login",
                style: TextStyle(
                    color: ColorManager.primary,
                    fontWeight: FontWeight.w700,
                    fontSize: 13.sp)),
            hight: 7.h,
            width: 80.w),
        CircleAvatar(
          backgroundColor: ColorManager.primary,
          child: Icon(Icons.facebook_outlined,
              color: Colors.blueAccent, size: 30.sp),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
              child: Text(
            "-OR-",
            style: TextStyle(fontWeight: FontWeight.w800),
          )),
        ),
        CircleAvatar(
          backgroundColor: ColorManager.primary,
          child: Icon(Icons.whatsapp_outlined,
              color: Colors.greenAccent, size: 30.sp),
        ),
      ],
    );
    ;
  }
}
