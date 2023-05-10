import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:sizer/sizer.dart';

class CustomSlider extends StatelessWidget {
  var pageController = PageController();
  CustomSlider({key});

  @override
  Widget build(BuildContext context) {
    List<String> text = [
      "assets/2.jpg",
      "assets/2.jpg",
      "assets/2.jpg",
    ];
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Center(
          child: Container(
              height: MediaQuery.of(context).size.height * .20,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                //shape: BoxShape.circle
              ),
              child: CarouselSlider.builder(
                itemBuilder: (context, index, realIndex) => Container(
                  decoration: BoxDecoration(
                    // border: Border.all(
                    //   color: Colors.grey[200]!,
                    //   width: 5,
                    // ),
                    //  borderRadius: BorderRadius.circular(15.sp),
                    boxShadow: [
                      new BoxShadow(
                        color: Colors.white,
                        //  offset: new Offset(10.0, 10.0),
                      ),
                    ],
                  ),
                  height: 150,
                  // color: Colors.white,
                  // width: MediaQuery.of(context).size.width,
                  //  margin: EdgeInsets.symmetric(horizontal: 5.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage(
                          text[index],
                        ),
                      ),
                      // border:
                      // Border.all(
                      //   color: myWhite,
                      //   width: 5,
                      // ),
                      // borderRadius: BorderRadius.circular(15.sp),
                    ),
                  ),
                ),
                //items: text,
                options: CarouselOptions(
                  // clipBehavior: Clip.antiAliasWithSaveLayer,
                  // // height: 35.h,
                  // aspectRatio: 9 / 9,
                  // viewportFraction: 0.8,
                  // initialPage: 0,
                  // enableInfiniteScroll: true,
                  // reverse: false,
                  // autoPlay: true,
                  // autoPlayInterval: const Duration(seconds: 3),
                  // autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  // autoPlayCurve: Curves.fastOutSlowIn,
                  // enlargeCenterPage: true,
                  // enlargeFactor: 0.3,
                  // //onPageChanged: callbackFunction,
                  // scrollDirection: Axis.horizontal,
                  // enlargeStrategy: CenterPageEnlargeStrategy.scale,
                  initialPage: 0,
                  // enlargeCenterPage: true,
                  // autoPlayCurve: Curves.fastOutSlowIn,
                  autoPlay: true,
                  // dotSize: 6.0,
                  // autoPlayInterval: Duration(seconds: 3),
                ),
                itemCount: text.length,
              )),
        ),
        // Positioned(
        //   bottom: 45.w,
        //   left: 2.h,
        //   child: InkWell(
        //     onTap: () => {
        //       // controller.getProducts().then(
        //       //       (value) => navigator!.pop(),
        //       //     ),

        //       // controller.getProducts().then(
        //       //       (value) =>
        //       navigator!.pop(),
        //       //  ),
        //     },
        //     child: Container(
        //       height: 12.h,
        //       width: 4.h,
        //       color: Colors.transparent,
        //       child: Icon(
        //         CashHelper.getData("lang") == "ar"
        //             ? Icons.arrow_forward_ios
        //             : Icons.arrow_back_ios,
        //         color: myOrange,
        //         size: 20.sp,
        //       ),
        //     ),
        //   ),
        // ),
        // Padding(
        //   padding: EdgeInsets.only(bottom: 5.h),
        //   child: SmoothPageIndicator(
        //     effect: ScrollingDotsEffect(
        //       dotHeight: 15,
        //       dotWidth: 15,
        //       activeDotColor: myWhite,
        //       spacing: 20,
        //       dotColor: Colors.grey[600]!,
        //     ),
        //     controller: pageController,
        //     count: 3,
        //   ),
        // ),
      ],
    );
  }
}
