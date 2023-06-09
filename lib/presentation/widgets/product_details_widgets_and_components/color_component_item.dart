import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled/core/theme/app_colors.dart';

class ColorComponentItem extends StatelessWidget {
  final int index;
  final int currentIndex;
  final Color color;
  final void Function()? onTap;
  const ColorComponentItem({Key? key, required this.index, required this.currentIndex, required this.color, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.w,vertical: 5.h),
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: 40.h,
          width: 40.w,
          padding: EdgeInsets.all(5.r),
          decoration: BoxDecoration(
            border: Border.all(
              color: index==currentIndex?AppColors.orangeColor:Colors.transparent,
            ),
            shape: BoxShape.circle,
          ),
          child: CircleAvatar(backgroundColor: color,),
        ),
      ),
    );
  }
}
