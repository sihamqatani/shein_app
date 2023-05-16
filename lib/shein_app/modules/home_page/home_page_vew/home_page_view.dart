import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shein_app/shein_app/core/utils/utils_widgets/custom_tabBar.dart';
import 'package:shein_app/shein_app/modules/home_page/home_page_controller/home_page_controller.dart';
import 'package:shein_app/shein_app/modules/home_page/home_page_vew/components/custom_all_part.dart';
import 'package:shein_app/shein_app/modules/home_page/home_page_vew/components/custom_man_part.dart';
import 'package:shein_app/shein_app/modules/home_page/home_page_vew/components/custom_search_text_field.dart';
import 'package:shein_app/shein_app/modules/home_page/home_page_vew/components/custom_women_part.dart';
import 'package:shein_app/shein_app/modules/home_page/home_page_vew/components/data.dart';
import 'package:shein_app/shein_app/modules/home_page/sliverscaffold.dart';
import 'package:sizer/sizer.dart';

import 'components/cateogry.dart';

class HomePageView extends StatefulWidget {
  @override
  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView>
    with SingleTickerProviderStateMixin {
  TabController? tabController;

  void initState() {
    tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    //tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var controller = TextEditingController();
    return GetBuilder<HomePageController>(
      init: HomePageController(),
      builder: (gcontroller) => SafeArea(
        child: SliverScaffold(
          tabController: tabController!,
          // The content of the scroll view
          body: TabBarView(
            controller: tabController,
            children: <Widget>[
              CustomAllPart(),
              CustomWomenPart(),
              CustomManPart(),
              // Center(
              //   child: Text(
              //     'HEIBGETRANKE',
              //     style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
              //   ),
              // ),
              // Center(
              //   child: Text(
              //     'NO DATA',
              //     style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
              //   ),
              // ),
              // Center(
              //   child: Text(
              //     'NO DATA',
              //     style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
              //   ),
              //  ),
              // Center(
              //   child: Text(
              //     'NO DATA',
              //     style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
              //   ),
              // ),
              // Center(
              //   child: Text(
              //     'NO DATA',
              //     style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
              //   ),
              // ),
            ],
          ),

          // TabBarView(
          //   controller: tabController,
          //   children: <Widget>[
          //     Center(
          //       child: CustomAllPart(),
          //     ),
          //     Center(
          //       child: Text(
          //         'KALTEGETRANKE',
          //         style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
          //       ),
          //     ),
          //     Center(
          //       child: Text(
          //         'HEIBGETRANKE',
          //         style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
          //       ),
          //     ),
          //     Center(
          //       child: Text(
          //         'NO DATA',
          //         style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
          //       ),
          //     ),
          //     Center(
          //       child: Text(
          //         'NO DATA',
          //         style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
          //       ),
          //     ),
          //     Center(
          //       child: Text(
          //         'NO DATA',
          //         style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
          //       ),
          //     ),
          //     Center(
          //       child: Text(
          //         'NO DATA',
          //         style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
          //       ),
          //     ),
          //     Center(
          //       child: Text(
          //         'NO DATA',
          //         style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
          //       ),
          //     ),
          //   ],
          // ),
          // ),
        ),
      ),
    );
  }
}





// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:sizer/sizer.dart';

// import '../home_page_controller/home_page_controller.dart';
// import '../sliverscaffold.dart';
// import 'components/custom_all_part.dart';
// import 'components/custom_women_part.dart';

// class HomePageView extends StatelessWidget {
//   const HomePageView({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<HomePageController>(
//       init: HomePageController(),
//       builder: (gcontroller) => DefaultTabController(
//         length: 8,
//         child: Scaffold(
//           appBar: AppBar(
//             bottom: PreferredSize(
//               preferredSize: Size.fromHeight(20.h),
//               child: Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: TabBar(
//                   tabs: [
//                     Text('ALL'),
//                     Text('WOMEN'),
//                     Text('MEN'),
//                     Text('KIDS'),
//                     Text('CURVE+PLUS'),
//                     Text('HOME+PETS'),
//                     Text('SPORTS'),
//                     Text('ELECTRONCS'),
//                   ],
//                   indicator: BoxDecoration(
//                     border: Border(
//                       bottom: BorderSide(
//                         color: Colors.black,
//                         width: 2.0,
//                       ),
//                     ),
//                   ),
//                   labelColor: Colors.black,
//                   unselectedLabelColor: Colors.grey,
//                 ),
//               ),
//             ),
//           ),
//           // The content of the scroll view
//           body: TabBarView(
//             children: <Widget>[
//               CustomAllPart(),
//               Center(child: CustomWomenPart()),
//               Center(
//                 child: Text(
//                   'HEIBGETRANKE',
//                   style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
//                 ),
//               ),
//               Center(
//                 child: Text(
//                   'NO DATA',
//                   style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
//                 ),
//               ),
//               Center(
//                 child: Text(
//                   'NO DATA',
//                   style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
//                 ),
//               ),
//               Center(
//                 child: Text(
//                   'NO DATA',
//                   style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
//                 ),
//               ),
//               Center(
//                 child: Text(
//                   'NO DATA',
//                   style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
//                 ),
//               ),
//               Center(
//                 child: Text(
//                   'NO DATA',
//                   style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
