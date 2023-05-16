import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class RankingRow extends StatelessWidget {
  const RankingRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(1.h),
      child: Row(children: [
        Text("RANKING NOW"),
        Spacer(),
        Wrap(
          children: [
            Text(
              "View All",
              style: TextStyle(color: Colors.grey[400]),
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: Colors.grey[400],
              size: 12.sp,
            )
          ],
        ),
      ]),
    );
  }
}
