import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:shein_app/shein_app/modules/home_page/home_page_vew/components/custom_discount_card.dart';
import 'package:sizer/sizer.dart';

class CustomStaggredGridvie extends StatelessWidget {
  const CustomStaggredGridvie({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.custom(
        //physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverWovenGridDelegate.count(
          crossAxisCount: 2,
          mainAxisSpacing: 1,
          crossAxisSpacing: 1,
          pattern: [
            WovenGridTile(1),
            WovenGridTile(
              5 / 7,
              crossAxisRatio: .999,
              alignment: AlignmentDirectional.centerEnd,
            ),
          ],
        ),
        childrenDelegate:
            SliverChildBuilderDelegate((context, index) => ProductCard()),
      ),
    );
    ;
  }
}
