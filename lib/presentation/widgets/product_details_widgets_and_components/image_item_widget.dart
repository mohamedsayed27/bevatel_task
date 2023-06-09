import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/theme/app_colors.dart';

class ImageItemWidget extends StatelessWidget {
  final void Function()? onTap;
  final String image;
  final int index;
  final int currentIndex;
  const ImageItemWidget({Key? key, this.onTap, required this.image, required this.index, required this.currentIndex}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: 75.h,
          width: 75.w,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15.r),
            border: Border.all(
              color: index == currentIndex ? AppColors.orangeColor : Colors.white,
            ),
            boxShadow: [
              BoxShadow(
                offset: Offset(2.w, 4.h),
                blurRadius: 6.r,
                color: Colors.black.withOpacity(0.19),
              ),
            ],
          ),
          child: Center(
            child: Image.asset(
              image,
              width: 50.w,
              height: 50.h,
            ),
          ),
        ),
      ),
    );
  }
}
