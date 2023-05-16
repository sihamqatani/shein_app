import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:shein_app/shein_app/core/dummy/dummy.dart';
import 'package:shein_app/shein_app/modules/home_page/home_page_controller/home_page_controller.dart';
import 'package:shein_app/shein_app/modules/home_page/home_page_vew/components/custom_discount_card.dart';
import 'package:shein_app/shein_app/modules/home_page/home_page_vew/components/custom_staggred_card.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class CustomStaggredGridvie extends GetView<HomePageController> {
  const CustomStaggredGridvie({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(1.h),
        child: GetBuilder<HomePageController>(
          init: HomePageController(),
          builder: (controller) => LayoutBuilder(
            builder: (context, constraints) {
              final double availableWidth = constraints.maxWidth;
              final bool isSmallScreen = availableWidth <= 600.0;
              final int crossAxisCount = isSmallScreen ? 2 : 4;
              final double aspectRatio = isSmallScreen ? 0.8 : 1.2;
              return StaggeredGridView.countBuilder(
                physics: NeverScrollableScrollPhysics(),
                crossAxisCount: 6,
                shrinkWrap: true,
                itemCount: 5,
                itemBuilder: (BuildContext context, int index) =>
                    CustomStaggredCard(category: cateogrries[index]),
                staggeredTileBuilder: (int index) {
                  controller.isHeight = index.isEven;
                  return StaggeredTile.count(3, index.isEven ? 4 : 5);
                },
                mainAxisSpacing: 1.0,
                crossAxisSpacing: 1.0,
              );
            },
          ),
        ));
  }
}
