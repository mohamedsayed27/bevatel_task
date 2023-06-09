import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/theme/app_colors.dart';

class BottomNavBarIcon extends StatelessWidget {
  final String iconPath;
  final void Function() onTap;
  final int currentIndex;
  final int index;
  final double? iconWidth;
  final double? iconHeight;

  const BottomNavBarIcon({
    Key? key,
    required this.iconPath,
    required this.onTap,
    required this.currentIndex,
    required this.index,
    this.iconWidth,
    this.iconHeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        padding: EdgeInsets.zero,
        side: const BorderSide(color: Colors.transparent),
        foregroundColor: AppColors.lightOrangeColor,
        backgroundColor: AppColors.whitColor,
        shape: const CircleBorder(),
      ),
      onPressed: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            iconPath,
            width: iconWidth ?? 30.w,
            height: iconHeight ?? 30.h,
            colorFilter: ColorFilter.mode(
              currentIndex == index
                  ? AppColors.orangeColor
                  : AppColors.greyColor,
              BlendMode.srcIn,
            ),
          ),
          if(currentIndex == index)SizedBox(
            height: 5.h,
          ),
          if(currentIndex == index)CircleAvatar(
            radius: 3.r,
            backgroundColor: AppColors.orangeColor,
          ),
        ],
      ),
    );
  }
}
