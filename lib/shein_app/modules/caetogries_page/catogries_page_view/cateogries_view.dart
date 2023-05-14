import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:shein_app/shein_app/core/utils/routes/api_routes.dart';
import 'package:shein_app/shein_app/core/utils/utils_widgets/custom_tabBar.dart';
import 'package:shein_app/shein_app/data/models/product_model.dart';
import 'package:shein_app/shein_app/modules/caetogries_page/cateogries_page_controller/cateogries_page_controller.dart';
import 'package:shein_app/shein_app/modules/caetogries_page/catogries_page_view/components/custom_sub_cateory_container.dart';
import 'package:shein_app/shein_app/modules/home_page/home_page_vew/components/custom_search_text_field.dart';
import 'package:sizer/sizer.dart';

import '../../../core/utils/theme/app_color.dart';

class CateogriesPageView extends StatelessWidget {
  CateogriesPageView({Key? key}) : super(key: key);
  TextEditingController? tController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    TabController? tabController;
    return GetBuilder<CateogriesController>(
        init: CateogriesController(),
        builder: (controller) => DefaultTabController(
              length: controller.tabs.length,
              child: Scaffold(
                appBar: AppBar(
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
                          controller: tController!,
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
                      preferredSize: Size.fromHeight(8.h),
                      child: controller.tabs.isNotEmpty
                          ? CustomTabBar(
                              tabs: controller.tabs,
                            )
                          : SpinKitFadingCircle(
                              size: 20.sp,
                              color: Colors.black,
                            )),
                ),
                body: TabBarView(
                  children: controller.cateogry.map((item) {
                    return Row(children: [
                      Container(
                        width: 27.w,
                        color: Colors.grey[300],
                        child: controller.subCateogry.isNotEmpty
                            ? ListView.builder(
                                itemCount: controller.subCateogry.length,
                                itemBuilder: (context, index) {
                                  return SubCateogryContainer(
                                    x: index,
                                    name: controller.subCateogry[index].name,
                                  );
                                },
                              )
                            : SpinKitFadingCircle(
                                size: 20.sp,
                                color: ColorManager.primary,
                              ),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width * .7,
                        child: GetBuilder<CateogriesController>(
                          init: CateogriesController(),
                          builder: (controller) =>
                              PagedGridView<int, ProductItem>(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              mainAxisSpacing: 5,
                              crossAxisSpacing: 5,
                            ),
                            pagingController: controller.pagingController,
                            builderDelegate:
                                PagedChildBuilderDelegate<ProductItem>(
                              itemBuilder: (context, item, index) {
                                return Column(children: [
                                  Container(
                                    width: 80.0,
                                    height: 15.h,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                    ),
                                    child: CachedNetworkImage(
                                      height: 5.h,
                                      imageUrl: ApiRoutes.storageImage +
                                          controller.productItem[index]
                                              .thumbnailImage!,
                                      fit: BoxFit.cover,
                                      errorWidget: (context, url, error) =>
                                          Image.asset("assets/sh.png"),
                                    ),
                                  ),
                                  Text(controller.productItem[index].name!)
                                ]);
                              },
                              firstPageProgressIndicatorBuilder: (_) =>
                                  Center(child: CircularProgressIndicator()),
                              newPageProgressIndicatorBuilder: (_) =>
                                  Center(child: CircularProgressIndicator()),
                            ),
                          ),
                        ),
                      )
                    ]);
                  }).toList(),
                ),
              ),
            ));
  }
}
