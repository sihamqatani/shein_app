import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shein_app/shein_app/core/utils/theme/app_color.dart';
import 'package:shein_app/shein_app/core/utils/utils_widgets/headline_text.dart';
import 'package:shein_app/shein_app/modules/auth_page/components/custom_button.dart';
import 'package:shein_app/shein_app/modules/home_page/home_page_vew/components/custom_container.dart';
import 'package:shein_app/shein_app/modules/home_page/home_page_vew/components/custom_dailry.dart';
import 'package:shein_app/shein_app/modules/home_page/home_page_vew/components/custom_slider.dart';
import 'package:shein_app/shein_app/modules/home_page/home_page_vew/components/discount_row_time.dart';
import 'package:shein_app/shein_app/modules/home_page/home_page_vew/components/offers_container.dart';
import 'package:shein_app/shein_app/modules/home_page/home_page_vew/components/ranking_row.dart';
import 'package:shein_app/shein_app/modules/home_page/home_page_vew/components/shop_by_cateog.dart';
import 'package:sizer/sizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../core/dummy/dummy.dart';
import '../../home_page_controller/home_page_controller.dart';
import 'custom_Staggred_grid_view.dart';
import 'custom_contact_us.row.dart';
import 'custom_discount_card.dart';
import 'custom_spotlight.dart';
import 'grid_page_view.dart';

class CustomManPart extends StatelessWidget {
  const CustomManPart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const NeverScrollableScrollPhysics(),
      children: [
        OffersContainer(),
        Padding(
          padding: EdgeInsets.all(1.h),
          child: Container(
            height: 15.w,
            child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              separatorBuilder: (context, index) => SizedBox(
                width: 2.w,
              ),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) =>
                  CustomContainer(cate: cate[index]),
              itemCount: cate.length,
            ),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: 18.h,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/m3.jpg"), fit: BoxFit.cover),
          ),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Text(
                    "WAVES OF\n YOUTH",
                    style: TextStyle(
                        wordSpacing: 2,
                        color: ColorManager.primary,
                        fontWeight: FontWeight.bold,
                        fontSize: 3.h,
                        fontStyle: FontStyle.italic),
                  ),
                ),
                BlackButton(
                    title: Text(
                      "SHOP NOW >",
                      style: TextStyle(
                        color: ColorManager.primary,
                      ),
                    ),
                    hight: 4.h,
                    width: 25.w)
              ]),
        ),
        Padding(
          padding: EdgeInsets.all(1.h),
          child: Center(
            child: HeadlineText(
                text: "Shop by Cateogry",
                size: 14.sp,
                fontWeight: FontWeight.w600),
          ),
        ),
        GetBuilder<HomePageController>(
          builder: (controller) => Center(
            child: Padding(
              padding: EdgeInsets.all(1.h),
              child: Container(
                height: 25.h,
                child: PageView.builder(
                    onPageChanged: (value) {
                      controller.changeCurrentIndex(value);
                    },
                    itemCount: 2,
                    controller: controller.curnnetPage,
                    itemBuilder: (context, index) {
                      return GridView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: 8,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4,
                            crossAxisSpacing: 2,
                            mainAxisSpacing: 4),
                        itemBuilder: (BuildContext context, int index) {
                          return ShopByCateogrie(
                              cateogreis: cateogrries[index]);
                        },
                      );
                    }),
              ),
            ),
          ),
        ),
        GetBuilder<HomePageController>(
          builder: (controller) => Center(
            child: SmoothPageIndicator(
              effect: WormEffect(
                dotHeight: 10,
                dotWidth: 10,
                activeDotColor: Colors.red[400]!,
                spacing: 30,
                dotColor: Colors.black,
              ),
              controller: controller.curnnetPage,
              count: 2,
            ),
          ),
          init: HomePageController(),
        ),
        RankingRow(),
        SizedBox(
          height: 34.h,
          width: 90.w,
          child: Padding(
            padding: EdgeInsets.all(1.h),
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: collection.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 27.h,
                        width: 110.w,
                        color: Colors.grey[200],
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(cateogrries[index].name!),
                            ),
                            Row(children: [
                              DairlyDrop(
                                localStores: cateogrries[index],
                              ),
                              DairlyDrop(
                                localStores: cateogrries[index],
                              ),
                              DairlyDrop(
                                localStores: cateogrries[index],
                              )
                            ]),
                          ],
                        ),
                      ),
                    )),
          ),
        ),
        DiscountRowTime(),
        Container(
          height: 30.h,
          width: 100.w,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: 6,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => ProductCard(
                      switchy: 1,
                      localStores: cateogrries[index],
                    )),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(1.h),
          child: Center(
            child: HeadlineText(
                text: "dailydrops", size: 14.sp, fontWeight: FontWeight.w600),
          ),
        ),
        Container(
          height: 30.h,
          width: 100.w,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: 6,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => DairlyDrop(
                      localStores: cateogrries[index],
                    )),
          ),
        ),
        Center(
          child: Text(
            "Recommanded",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 13.sp),
          ),
        ),
        SizedBox(
            height: 100.h, width: 100.h, child: const CustomStaggredGridvie()),
        SizedBox(
          height: 5.h,
        ),
        CustomContactRow(
          text: "Contact us",
        ),
        CustomContactRow(
          text: "Contact us",
        ),
        CustomContactRow(
          text: "Contact us",
        ),
        CustomContactRow(
          text: "Contact us",
        ),
      ],
    );
  }
}
