import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:shein_app/shein_app/modules/home_page/home_page_vew/components/custom_all_part.dart';
import 'package:shein_app/shein_app/modules/home_page/home_page_vew/components/custom_search_text_field.dart';
import 'package:shein_app/shein_app/modules/home_page/home_page_vew/components/data.dart';
import 'package:sizer/sizer.dart';
import 'package:vertical_scrollable_tabview/vertical_scrollable_tabview.dart';

import 'components/cateogry.dart';

class HomePageView extends StatefulWidget {
  @override
  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  final List<Category> data = ExampleData.data;

  // TabController More Information => https://api.flutter.dev/flutter/material/TabController-class.html

  void initState() {
    tabController = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var controller = TextEditingController();
    return Scaffold(
      body:
          //     VerticalScrollableTabView(
          //   verticalScrollPosition: VerticalScrollPosition.begin,
          //   listItemData: data,
          //   eachItemChild: (object, index) =>
          //       CategorySection(category: object as Category),
          //   tabController: tabController,
          //   slivers: [
          //     SliverAppBar(
          //       // automaticallyImplyLeading: false,
          //       toolbarHeight: 70,
          //       actions: [
          //         Padding(
          //           padding: EdgeInsets.all(1.h),
          //           child: SizedBox(
          //             width: 34.h,
          //             height: 8,
          //             child: MyAddTextField(
          //               label: "search",
          //               prefix: Icons.search,
          //               obcure: false,
          //               controller: controller,
          //             ),
          //           ),
          //         ),
          //         Padding(
          //           padding: EdgeInsets.all(1.h),
          //           child: Icon(
          //             Icons.mail,
          //             size: 6.w,
          //           ),
          //         ),
          //       ],
          //       leadingWidth: 15.h,
          //       elevation: 0,
          //       leading: Padding(
          //         padding: EdgeInsets.all(1.h),
          //         child: Row(
          //           children: [
          //             Icon(
          //               Icons.badge_sharp,
          //               size: 6.w,
          //             ),
          //             SizedBox(
          //               width: .5.h,
          //             ),
          //             Icon(
          //               Icons.favorite,
          //               size: 6.w,
          //             ),
          //           ],
          //         ),
          //       ),
          //       bottom: TabBar(
          //         //  physics: NeverScrollableScrollPhysics(),
          //         isScrollable: true,
          //         controller: tabController,
          //         indicatorPadding: const EdgeInsets.symmetric(horizontal: 16.0),
          //         indicatorColor: Colors.black,
          //         labelColor: Colors.black,
          //         unselectedLabelColor: Colors.grey,
          //         indicatorWeight: 3.0,
          //         tabs: data.map((e) {
          //           return Tab(text: e.title);
          //         }).toList(),
          //         onTap: (index) {
          //           // VerticalScrollableTabBarStatus.setIndex(index);
          //         },
          //       ),
          //       // bottom: PreferredSize(
          //       //   preferredSize: Size.fromHeight(5.h),
          //       //   child: Container(
          //       //     height: 5.h,
          //       //     width: double.infinity,
          //       //     decoration: BoxDecoration(
          //       //       color: Colors.white,
          //       //       //  borderRadius: BorderRadius.vertical(top: Radius.circular(30.0)),
          //       //     ),
          //       //     child: Center(child: Text("تفاصيل")),
          //       //   ),
          //       // ),
          //       flexibleSpace: FlexibleSpaceBar(
          //         collapseMode: CollapseMode.parallax,
          //         background: Container(
          //           height: 1.h,
          //           child: Image.asset(
          //             "assets/1.png",
          //             fit: BoxFit.fill,
          //           ),
          //         ),
          //       ),
          //       //backgroundColor: Colors.grey[50],
          //       // title: const Text('App Bar'),
          //       expandedHeight: 300,
          //       pinned: true,
          //       // forceElevated: innerBoxIsScrolled,
          //     ),
          //   ],
          // )
          NestedScrollView(
        clipBehavior: Clip.antiAlias,
        dragStartBehavior: DragStartBehavior.down,
        // reverse: true,
        // This builds the scrollable content above the body
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverAppBar(
            // automaticallyImplyLeading: false,
            toolbarHeight: 70,
            actions: [
              Padding(
                padding: EdgeInsets.all(1.h),
                child: SizedBox(
                  width: 34.h,
                  height: 8,
                  child: MyAddTextField(
                    label: "search",
                    prefix: Icons.search,
                    obcure: false,
                    controller: controller,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(1.h),
                child: Icon(
                  Icons.mail,
                  size: 6.w,
                ),
              ),
            ],
            leadingWidth: 15.h,
            elevation: 0,
            leading: Padding(
              padding: EdgeInsets.all(1.h),
              child: Row(
                children: [
                  Icon(
                    Icons.badge_sharp,
                    size: 6.w,
                  ),
                  SizedBox(
                    width: .5.h,
                  ),
                  Icon(
                    Icons.favorite,
                    size: 6.w,
                  ),
                ],
              ),
            ),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(5.h),
              // child: Container(
              //   height: 5.h,
              //   width: double.infinity,
              //   decoration: BoxDecoration(
              //     color: Colors.white,
              //     //  borderRadius: BorderRadius.vertical(top: Radius.circular(30.0)),
              //   ),
              //   child: Center(child: Text("تفاصيل")),
              // ),
              child: TabBar(
                indicatorWeight: 3.h,
                controller: tabController,
                labelColor: Colors.grey,
                isScrollable: true,
                indicatorColor: Colors.transparent,
                unselectedLabelColor: Colors.grey,
                unselectedLabelStyle: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                  fontWeight: FontWeight.w700,
                ),
                labelStyle: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
                tabs: <Widget>[
                  Text('BROTCHEN'),
                  Text('KALTEGETRANKE'),
                  Text('HEIBGETRANKE'),
                  Text('MILCHPPODUKE'),
                ],
              ),
            ),
            flexibleSpace: FlexibleSpaceBar(
              collapseMode: CollapseMode.parallax,
              background: Container(
                height: 1.h,
                child: Image.asset(
                  "assets/1.png",
                  fit: BoxFit.fill,
                ),
              ),
            ),
            //backgroundColor: Colors.grey[50],
            // title: const Text('App Bar'),
            expandedHeight: 300,
            pinned: true,
            forceElevated: innerBoxIsScrolled,
          ),
        ],
        // The content of the scroll view
        body: TabBarView(
          controller: tabController,
          children: <Widget>[
            Center(
              child: CustomAllPart(),
            ),
            Center(
              child: Text(
                'KALTEGETRANKE',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
              ),
            ),
            Center(
              child: Text(
                'HEIBGETRANKE',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
              ),
            ),
            Center(
              child: Text(
                'MILCHPPODUKE',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
