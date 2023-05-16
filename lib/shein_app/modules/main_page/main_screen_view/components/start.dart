import 'dart:ui';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shein_app/shein_app/core/utils/theme/app_color.dart';
import 'package:shein_app/shein_app/modules/main_page/main_screen_view/main_screen_view.dart';
import 'package:sizer/sizer.dart';

class Start extends StatelessWidget {
  const Start({key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primary,
      body: Center(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 250.0,
            child: TextLiquidFill(
              text: 'SHEIN',
              waveColor: Colors.black,
              boxBackgroundColor: Colors.white,
              textStyle: TextStyle(
                fontSize: 50.sp,
                fontWeight: FontWeight.bold,
              ),
              boxHeight: 300.0,
            ),
          ),
          InkWell(
              child: Text(
                "GET STARTED",
                style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
              ),
              onTap: (() => Get.to(MainScreenView()))),
        ],
      )
          //  Container(
          //     child: InkWell(
          //         onTap: (() => Get.to(MainScreenView())),
          //         child: Icon(Icons.home))),
          ),
    );
  }
}
