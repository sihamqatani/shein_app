import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'package:shein_app/shein_app/modules/home_page/home_page_vew/components/config.dart';

import '../../core/utils/utils_widgets/custom_tabBar.dart';
import 'home_page_vew/components/custom_search_text_field.dart';

const double _searchBarHeight = 54;
const double _searchBarVerticalMargin = 12;
const double _appBarCollapsedHeight =
    _searchBarHeight + _searchBarVerticalMargin * 2; // 78
const double _appBarExpandedHeight = 80 + _searchBarHeight; // 154

class SliverScaffold extends StatefulWidget {
  const SliverScaffold(
      {Key? key, required this.body, required this.tabController})
      : super(
          key: key,
        );

  final Widget body;
  final TabController tabController;

  @override
  _SliverScaffoldState createState() => _SliverScaffoldState();
}

class _SliverScaffoldState extends State<SliverScaffold>
    with SingleTickerProviderStateMixin {
  final ScrollController _scrollController = ScrollController();

  // 0.0 -> Expanded
  double currentExtent = 0.0;

  double get minExtent => 0.0;
  double get maxExtent => _scrollController.position.maxScrollExtent;

  double get deltaExtent => maxExtent - minExtent;

  Curve get curve => Curves.easeOutCubic;
  // Curve get curve => Curves.easeOutQuart;

  // Curve get curve => Curves.easeOutQuint;
  // Curve get curve => Curves.easeOutExpo;
  // Curve get curve => Curves.easeOutCirc;
  // Curve get curve => Curves.fastLinearToSlowEaseIn;

  // Curve get curve => const Cubic(0.08, 0.79, 0, 0.81);

  double actionSpacing = 24;
  double iconStrokeWidth = 1.8;
  double titlePaddingHorizontal = 16;
  double titlePaddingTop = 74;

  final Tween<double> actionSpacingTween = Tween(begin: 24, end: 0);
  final Tween<double> iconStrokeWidthTween = Tween(begin: 1.8, end: 1.2);
  final Tween<double> titlePaddingHorizontalTween = Tween(begin: 16, end: 48);
  final Tween<double> titlePaddingTopTween = Tween(begin: 74, end: 12);

  @override
  void initState() {
    super.initState();
    // tabController = TabController(length: 8, vsync: this);
    _scrollController.addListener(_scrollListener);
  }

  @override
  Widget build(BuildContext context) {
    var controller = TextEditingController();
    return NestedScrollView(
      controller: _scrollController,
      headerSliverBuilder: (_, __) => [
        SliverAppBar(
          // bottom: PreferredSize(
          //   preferredSize: Size.fromHeight(1.h),
          //   child: SizedBox(
          //       height: 10.h,
          //       //  color: Theme.of(context).scaffoldBackgroundColor,
          //       child: CustomTabBar(
          //         tabController: widget.tabController,
          //       )),
          // ),

          leading: Padding(
            padding: EdgeInsets.all(1.h),
            child: Icon(
              Icons.mail_outline,
              size: 6.w,
            ),
          ),
          // leading: Row(
          //   children: [
          //     SizedBox(width: actionSpacing),
          //     IconButton(
          //       onPressed: () {},
          //       splashRadius: 24,
          //       icon: CategoryIconPainter.getCustomPaint(iconStrokeWidth),
          //     ),
          //   ],
          // ),
          leadingWidth: 74,
          centerTitle: true,
          actions: [
            Padding(
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

            // IconButton(
            //   onPressed: () {},
            //   splashRadius: 24,
            //   icon: NotificationIconPainter.getCustomPaint(iconStrokeWidth),
            // ),
            // SizedBox(width: actionSpacing),
          ],

          toolbarHeight: _appBarCollapsedHeight,
          collapsedHeight: _appBarCollapsedHeight,
          expandedHeight: _appBarExpandedHeight,
          flexibleSpace: FlexibleSpaceBar.createSettings(
            // isScrolledUnder: true,
            currentExtent: _appBarCollapsedHeight,
            minExtent: _appBarCollapsedHeight,
            maxExtent: _appBarExpandedHeight,
            toolbarOpacity: 1.0,
            child: FlexibleSpaceBar(
              //  expandedTitleScale: 1,
              titlePadding: EdgeInsets.only(
                top: titlePaddingTop,
                left: titlePaddingHorizontal,
                right: titlePaddingHorizontal,
              ),
              centerTitle: true,
              title: SizedBox(
                //width: 36.h,
                height: _searchBarHeight,
                child: MyAddTextField(
                  suffix: Icons.camera_alt_outlined,
                  label: "search",
                  prefix: Icons.search,
                  obcure: false,
                  controller: controller,
                ),
              ),
            ),
          ),
          backgroundColor: primaryColor,
          elevation: 0,
          shadowColor: Colors.black45,
          pinned: true,
        ),
        SliverPersistentHeader(
            pinned: true, delegate: _TabBarDelegate(widget.tabController)),
      ],

      body: widget.body,
      //et.body,
    );
  }

  _scrollListener() {
    setState(() {
      currentExtent = _scrollController.offset;

      actionSpacing = _remapCurrentExtent(actionSpacingTween);
      iconStrokeWidth = _remapCurrentExtent(iconStrokeWidthTween);
      titlePaddingHorizontal = _remapCurrentExtent(titlePaddingHorizontalTween);
      titlePaddingTop = _remapCurrentExtent(titlePaddingTopTween);
    });
  }

  double _remapCurrentExtent(Tween<double> target) {
    final double deltaTarget = target.end! - target.begin!;

    double currentTarget =
        (((currentExtent - minExtent) * deltaTarget) / deltaExtent) +
            target.begin!;

    double t = (currentTarget - target.begin!) / deltaTarget;

    double curveT = curve.transform(t);

    return lerpDouble(target.begin!, target.end!, curveT)!;
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }
}

class _TabBarDelegate extends SliverPersistentHeaderDelegate {
  TabController tabController;
  _TabBarDelegate(this.tabController);
  final TabBar tabBar = TabBar(tabs: [
    Text('ALL'),
    Text('WOMEN'),
    Text('MEN'),
  ]);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
        // height: 10.h,
        color: Theme.of(context).scaffoldBackgroundColor,
        //width: 30.w,
        child: Align(
          child: CustomHomeTabBar(
            //tabs: tabBar,
            tabController: tabController,
          ),
        ));
  }

  @override
  double get maxExtent => tabBar.preferredSize.height;

  @override
  double get minExtent => tabBar.preferredSize.height;

  @override
  bool shouldRebuild(_TabBarDelegate oldDelegate) {
    return false;
  }
}
