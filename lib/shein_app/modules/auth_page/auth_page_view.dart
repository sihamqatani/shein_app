import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shein_app/shein_app/modules/auth_page/register_page/register_page_controoler.dart';
import 'package:shein_app/shein_app/modules/auth_page/register_page/register_page_view.dart';
import 'package:sizer/sizer.dart';

class AuthPageView extends StatelessWidget {
  AuthPageView({Key? key}) : super(key: key);
  TabController? tabController;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(20.h),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Center(
                    child: SizedBox(
                        width: 20.w,
                        height: 15.h,
                        child: Image.asset("assets/sh.png")),
                  ),
                  TabBar(
                    tabs: [
                      Tab(
                        child: Text(
                          'REGISTER',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Tab(
                        child: Text(
                          'LOGIN', //
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                    indicator: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Colors.black,
                          width: 2.0,
                        ),
                      ),
                    ),
                    labelColor: Colors.black,
                    unselectedLabelColor: Colors.grey,
                  ),
                ],
              ),
            ),
          ),
        ),
        body: TabBarView(
          children: [
            Center(
                child: GetBuilder<RegisterController>(
              builder: (controller) => RegisterPageView(),
              init: RegisterController(),
            )),
            Center(
              child: Text(
                'Register Screen',
                style: TextStyle(fontSize: 32),
              ),
            ),
          ],
        ),
      ),
    );
    // Scaffold(
    //     appBar: AppBar(),
    //     body: Center(
    //       child: Padding(
    //         padding: EdgeInsets.all(1.h),
    //         child: ListView(children: [
    //           SizedBox(
    //               width: 20.w,
    //               height: 12.h,
    //               child: Image.asset("assets/sh.png")),
    //           const DefaultTabController(
    //               length: 2,
    //               child: TabBar(
    //                 tabs: [Text("Login"), Text("Register")],
    //               )),
    //           TabBarView(children: [RegisterPageView()])
    //         ]),
    //       ),
    //     ));
  }
}
