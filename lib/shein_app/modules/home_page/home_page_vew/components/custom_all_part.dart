import 'package:flutter/material.dart';
import 'package:shein_app/shein_app/core/utils/theme/app_color.dart';
import 'package:shein_app/shein_app/modules/home_page/home_page_vew/components/custom_container.dart';
import 'package:shein_app/shein_app/modules/home_page/home_page_vew/components/custom_slider.dart';
import 'package:shein_app/shein_app/modules/home_page/home_page_vew/components/custom_text_offers.dart';
import 'package:sizer/sizer.dart';

class CustomAllPart extends StatelessWidget {
  const CustomAllPart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 1.h),
      child: Column(
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
                itemBuilder: (context, index) => const CustomContainer(),
                itemCount: 4,
              ),
            ),
          ),
          CustomSlider(),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomTextOffers(),
              CustomTextOffers(),
              CustomTextOffers()
            ],
          )
        ],
      ),
    );
  }
}
