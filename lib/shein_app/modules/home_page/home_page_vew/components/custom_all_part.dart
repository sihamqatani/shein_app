import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shein_app/shein_app/core/utils/theme/app_color.dart';
import 'package:shein_app/shein_app/data/models/local_store.dart';
import 'package:shein_app/shein_app/modules/home_page/home_page_controller/home_page_controller.dart';
import 'package:shein_app/shein_app/modules/home_page/home_page_vew/components/custom_Staggred_grid_view.dart';
import 'package:shein_app/shein_app/modules/home_page/home_page_vew/components/custom_contact_us.row.dart';
import 'package:shein_app/shein_app/modules/home_page/home_page_vew/components/custom_container.dart';
import 'package:shein_app/shein_app/modules/home_page/home_page_vew/components/custom_discount_card.dart';
import 'package:shein_app/shein_app/modules/home_page/home_page_vew/components/custom_slider.dart';
import 'package:shein_app/shein_app/modules/home_page/home_page_vew/components/custom_spotlight.dart';
import 'package:shein_app/shein_app/modules/home_page/home_page_vew/components/custom_text_offers.dart';
import 'package:sizer/sizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../core/dummy/dummy.dart';

class CustomAllPart extends StatelessWidget {
  const CustomAllPart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 1.h),
      child: ListView(
        shrinkWrap: true,
        children: [
          Container(
              child: Center(
                  child: Text(
                "Buy 2 get 1 of them 50% OFF",
                style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                    color: ColorManager.primary),
              )),
              height: 6.h,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                      Colors.orange[700]!,
                      Colors.red,
                    ]),
              )),
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
          CustomSlider(),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              CustomTextOffers(),
              CustomTextOffers(),
              CustomTextOffers()
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 1.h),
            child: Center(
              child: Container(
                color: Colors.black,
                height: 3.h,
                width: 12.h,
                child: Center(
                  child: Text(
                    " Code: WWs23",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 9.sp),
                  ),
                ),
              ),
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
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 4,
                                  crossAxisSpacing: 2,
                                  mainAxisSpacing: 4),
                          itemBuilder: (BuildContext context, int index) {
                            return Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5.h),
                                      image: DecorationImage(
                                        image: AssetImage(
                                            cateogrries[index].image!),
                                      ))
                                  // cateogrries[index].image!) )),
                                  ,
                                  height: 8.h,
                                  //Image.asset(
                                  // cateogrries[index].image!)),
                                ),
                                Container(
                                    height: 3.h,
                                    child: Text(cateogrries[index].name!)),
                              ],
                            );
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
          Padding(
            padding: EdgeInsets.all(2.h),
            child: Container(
              height: 7.h,
              // width: 200.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3.w),
                image: const DecorationImage(
                    image: AssetImage("assets/2.jpg"), fit: BoxFit.fill),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(1.h),
            child: Row(
              children: [
                Row(children: [
                  Container(
                      color: Colors.black,
                      child: Text("01", style: TextStyle(color: Colors.white))),
                  Text(":"),
                  Container(
                      color: Colors.black,
                      child: Text("01", style: TextStyle(color: Colors.white))),
                  Text(":"),
                  Container(
                      color: Colors.black,
                      child: Text("01", style: TextStyle(color: Colors.white))),
                  Text(":")
                ]),
                Text("تنتهي في "),
                Spacer(),
                Text("تخيضات سريعة "),
              ],
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
                  itemBuilder: (context, index) => ProductCard(
                        switchy: 1,
                        localStores: cateogrries[index],
                      )),
            ),
          ),
          Container(
            height: 4.h,
            width: 100.w,
            child: Padding(
              padding: EdgeInsets.all(1.h),
              child: ListView.separated(
                  separatorBuilder: (context, index) => SizedBox(width: 4.h),
                  shrinkWrap: true,
                  itemCount: 6,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => InkWell(
                        onTap: () {},
                        child: Text(
                          "Up To 10%",
                          style: TextStyle(color: Colors.grey),
                        ),
                      )),
            ),
          ),
          SizedBox(
            height: 30.h,
            width: 100.w,
            child: Padding(
              padding: EdgeInsets.all(1.h),
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: cateogrries.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => ProductCard(
                        switchy: 2,
                        localStores: cateogrries[index],
                      )),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 2.h),
            child: Text(
              "SpotLight",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 13.sp),
            ),
          ),
          SizedBox(
            height: 25.h,
            width: 100.w,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: cateogrries.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => CustomSpotLight(
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
          Container(
              height: 50.h, width: 100.h, child: const CustomStaggredGridvie()),
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
      ),
    );
  }
}
