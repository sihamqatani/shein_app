import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shein_app/shein_app/modules/main_page/main_screen_view/main_screen_view.dart';

class Start extends StatelessWidget {
  const Start({key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
            child: InkWell(
                onTap: (() => Get.to(MainScreenView())),
                child: Icon(Icons.home))),
      ),
    );
  }
}
