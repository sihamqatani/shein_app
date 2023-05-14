import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:shein_app/shein_app/core/utils/theme/app_color.dart';
import 'package:shein_app/shein_app/modules/auth_page/components/custom_auth_text_field.dart';
import 'package:shein_app/shein_app/modules/auth_page/components/custom_button.dart';
import 'package:shein_app/shein_app/modules/auth_page/register_page/register_page_controoler.dart';
import 'package:sizer/sizer.dart';

import '../../../core/utils/functions/input_valid.dart';

class RegisterPageView extends GetView<RegisterController> {
  const RegisterPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RegisterController>(
      init: RegisterController(),
      builder: (controller) => Form(
        key: controller.formKey,
        child: ListView(
          padding: EdgeInsets.all(2.h),
          children: [
            Padding(
              padding: EdgeInsets.all(1.h),
              child: MyAuthTextField(
                controller: controller.nameController,
                obcure: false,
                label: "Name",
                validate: ((p0) {
                  return validInput(p0!, 3, 12, "name");
                }),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(1.h),
              child: MyAuthTextField(
                controller: controller.emailController,
                obcure: false,
                label: "Email or Phone number",
                validate: ((p0) {
                  return validInput(p0!, 10, 40, "email");
                }),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(1.h),
              child: MyAuthTextField(
                controller: controller.passwordController,
                obcure: controller.isshowpassword,
                label: "Password",
                suffix: controller.iconVisiblity,
                onTapIcon: () => controller.showPassword(),
                validate: ((p0) {
                  return validInput(p0!, 3, 12, "password");
                }),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(1.h),
              child: MyAuthTextField(
                suffix: controller.iconCVisiblity,
                onTapIcon: () => controller.showCheckedPassword(),
                controller: controller.confirmPasswordController,
                obcure: controller.ischecked,
                label: "Confirm-Password",
                validate: ((p0) {
                  return validInput(p0!, 3, 12, "confirm password");
                }),
              ),
            ),
            Obx(
              () => BlackButton(
                  onpress: () async {
                    FocusScope.of(context).unfocus();

                    await controller.createNewUser();
                  },
                  title: controller.isLoading == true
                      ? SpinKitFadingCircle(
                          size: 20.sp,
                          color: ColorManager.primary,
                        )
                      : Text("Register",
                          //  style: TextStyle(
                          //  color: ColorManager.primary,
                          //         fontWeight: FontWeight.w700,
                          //         fontSize: 13.sp)),
                          // title: Text("Register",
                          style: TextStyle(
                              color: ColorManager.primary,
                              fontWeight: FontWeight.w700,
                              fontSize: 13.sp)),
                  hight: 7.h,
                  width: 80.w),
            ),
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
        ),
      ),
    );
  }
}
