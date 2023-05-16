import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:shein_app/shein_app/core/utils/theme/app_color.dart';
import 'package:sizer/sizer.dart';

import 'components/custom_search_text_field.dart';

const double _searchBarHeight = 54;
const double _searchBarVerticalMargin = 12;
const double _appBarCollapsedHeight =
    _searchBarHeight + _searchBarVerticalMargin * 2; // 78
const double _appBarExpandedHeight = 150 + _searchBarHeight; // 154

class SheinAppBar extends StatefulWidget {
  const SheinAppBar({Key? key}) : super(key: key);

  @override
  _SheinAppBarState createState() => _SheinAppBarState();
}

class _SheinAppBarState extends State<SheinAppBar> {
  final ScrollController _scrollController = ScrollController();
  bool _showAppBar = true;
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
    _scrollController.addListener(() {
      if (_scrollController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        setState(() {
          _showAppBar = false;
        });
      }
      if (_scrollController.position.userScrollDirection ==
          ScrollDirection.forward) {
        setState(() {
          _showAppBar = true;
        });
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var controller = TextEditingController();
    return Scaffold(
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
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
                expandedTitleScale: 1,
                titlePadding: EdgeInsets.only(
                  top: titlePaddingTop,
                  left: titlePaddingHorizontal,
                  right: titlePaddingHorizontal,
                ),
                centerTitle: true,
                title: SizedBox(
                  width: 36.h,
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
            backgroundColor: ColorManager.primary,
            elevation: 0,
            shadowColor: Colors.black45,
            pinned: true,
          ),

          // SliverAppBar(
          //   pinned: true,
          //   expandedHeight: 200,
          //   flexibleSpace: FlexibleSpaceBar(
          //     background: Image.network(
          //       'https://picsum.photos/200',
          //       fit: BoxFit.cover,
          //     ),
          //   ),
          // ),
          SliverPersistentHeader(
            pinned: true,
            delegate: _TabBarDelegate(),
          ),

          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return ListTile(
                  title: Text('Item $index'),
                );
              },
              childCount: 50,
            ),
          ),
        ],
      ),
    );
  }
}

class _TabBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar _tabBar = TabBar(
    tabs: [
      Tab(text: 'Tab 1'),
      Tab(text: 'Tab 2'),
      Tab(text: 'Tab 3'),
    ],
  );

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.white,
      child: _tabBar,
    );
  }

  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  double get minExtent => _tabBar.preferredSize.height;

  @override
  bool shouldRebuild(_TabBarDelegate oldDelegate) {
    return false;
  }
}
