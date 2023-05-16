import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'package:shein_app/shein_app/core/utils/helpers/dio_helper/dio_helper.dart';
import 'package:shein_app/shein_app/core/utils/theme/app_theme.dart';
import 'package:shein_app/shein_app/modules/home_page/home_page_vew/home_page_view.dart';
import 'package:shein_app/shein_app/modules/home_page/home_page_vew/my_home_page.dart';
import 'package:shein_app/shein_app/modules/home_page/home_page_vew/pinned.dart';
import 'package:shein_app/shein_app/modules/main_page/main_screen_binding/main_screen_binding.dart';
import 'package:shein_app/shein_app/modules/main_page/main_screen_view/components/start.dart';
import 'package:shein_app/shein_app/modules/main_page/main_screen_view/main_screen_view.dart';
import 'package:shein_app/shein_app/modules/sliver_appbar.dart';
import 'package:sizer/sizer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  await DioHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) => GetMaterialApp(
          initialBinding: MainScreenBinding(),
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: getApplicationTheme(),
          home: //HomePageView()
              //MyHomePage() //ListScreen() // MyApps()
              //  MainScreenView(),
              Start()
          // SheinAppBar(),
          ),
    );
  }
}
