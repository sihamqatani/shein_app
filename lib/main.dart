import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shein_app/shein_app/core/utils/theme/app_theme.dart';
import 'package:shein_app/shein_app/modules/home_page/home_page_vew/home_page_view.dart';
import 'package:sizer/sizer.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: getApplicationTheme(),
        home: HomePageView(),
      ),
    );
  }
}
