import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shein_app/shein_app/modules/caetogries_page/cateogries_page_controller/cateogries_page_controller.dart';
import 'package:sizer/sizer.dart';

class CustomTabBar extends GetView<CateogriesController> {
  final TabController? tabController;
  List<Tab>? tabs;
  CustomTabBar({Key? key, this.tabController, this.tabs}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TabBar(
      // overlayColor: Colors.black,
      indicatorWeight: 3.h,
      controller: tabController ?? tabController,
      labelColor: Colors.black,
      // isScrollable: true,
      indicatorColor: Colors.transparent,
      unselectedLabelColor: Colors.grey,
      unselectedLabelStyle: TextStyle(
        fontSize: tabs == null ? 16 : 1.sp,
        color: Colors.grey,
        fontWeight: FontWeight.w700,
      ),
      onTap: (value) {
        controller.getCatogryById(controller.cateogry[value].id);
        print(value);
      },
      labelStyle: TextStyle(
        fontSize: tabs == null ? 16 : 10.sp,
        fontWeight: FontWeight.w700,
      ),
      tabs: tabs ??
          <Widget>[
            Text('ALL'),
            Text('WOMEN'),
            Text('MEN'),
            Text('KIDS'),
            Text('CURVE+PLUS'),
            Text('HOME+PETS'),
            Text('SPORTS'),
            Text('ELECTRONCS'),
          ],
    );
  }
}

class CustomTab extends StatelessWidget {
  const CustomTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 8,
        // overlayColor: Colors.black,

        child: TabBar(
          tabs: [
            Text('ALL'),
            Text('WOMEN'),
            Text('MEN'),
            Text('KIDS'),
            Text('CURVE+PLUS'),
            Text('HOME+PETS'),
            Text('SPORTS'),
            Text('ELECTRONCS'),
          ],
        ));
  }
}
