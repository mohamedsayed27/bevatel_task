import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled/presentation/widgets/home_screen_widgets_and_components/special_item_widget.dart';

import '../../../core/assets_path/fonts_path.dart';

class SpecialForYouComponent extends StatelessWidget {
  const SpecialForYouComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 18.w,vertical: 20.h),
      child: SizedBox(
        height: 200.h,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "Special for you",
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: FontsPath.poppinsMedium,
                    fontSize: 18.sp,
                  ),
                ),
                Text(
                  "See more",
                  style: TextStyle(
                    color: Colors.grey.shade600,
                    fontFamily: FontsPath.poppinsLight,
                    fontSize: 14.sp,
                  ),
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.zero,
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (BuildContext context, int index) {
                  return const SpecialItemWidget();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
