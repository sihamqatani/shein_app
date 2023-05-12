import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shein_app/shein_app/core/utils/utils_widgets/custom_tabBar.dart';
import 'package:shein_app/shein_app/modules/home_page/home_page_controller/home_page_controller.dart';
import 'package:shein_app/shein_app/modules/home_page/home_page_vew/components/custom_all_part.dart';
import 'package:shein_app/shein_app/modules/home_page/home_page_vew/components/custom_search_text_field.dart';
import 'package:shein_app/shein_app/modules/home_page/home_page_vew/components/data.dart';
import 'package:sizer/sizer.dart';

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
    tabController = TabController(length: 8, vsync: this);
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
    return GetBuilder<HomePageController>(
      init: HomePageController(),
      builder: (gcontroller) => Scaffold(
        body: NestedScrollView(
          floatHeaderSlivers: true,
          physics: const BouncingScrollPhysics(),
          clipBehavior: Clip.antiAlias,
          // dragStartBehavior: DragStartBehavior.start,
          // reverse: true,
          // This builds the scrollable content above the body
          headerSliverBuilder: (context, fals) => [
            SliverAppBar(
              // floating: true,

              automaticallyImplyLeading: true,
              //toolbarHeight: 70,
              actions: [
                Padding(
                  padding: EdgeInsets.all(1.h),
                  child: SizedBox(
                    width: 34.h,
                    height: 8,
                    child: MyAddTextField(
                      suffix: Icons.camera_alt_outlined,
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
                    Icons.mail_outline,
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
                      Icons.badge_outlined,
                      size: 6.w,
                    ),
                    SizedBox(
                      width: 1.w,
                    ),
                    Icon(
                      Icons.favorite_border,
                      size: 6.w,
                    ),
                  ],
                ),
              ),
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(5.h),
                child: Container(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    child: CustomTabBar(tabController: tabController)),
              ),
              flexibleSpace: FlexibleSpaceBar(
                // expandedTitleScale: 2,
                // stretchModes: [],
                //collapseMode: CollapseMode.values,
                background: Center(
                  child: Container(
                      // height: 5.h,
                      width: MediaQuery.of(context).size.width,
                      child: Image.asset("assets/sh.png")),
                ),
              ),
              //backgroundColor: Colors.grey[50],
              // title: const Text('App Bar'),
              expandedHeight: 200,

              pinned: true,
              // forceElevated: innerBoxIsScrolled,
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
                  'NO DATA',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
                ),
              ),
              Center(
                child: Text(
                  'NO DATA',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
                ),
              ),
              Center(
                child: Text(
                  'NO DATA',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
                ),
              ),
              Center(
                child: Text(
                  'NO DATA',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
                ),
              ),
              Center(
                child: Text(
                  'NO DATA',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
