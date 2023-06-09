import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/theme/app_colors.dart';

class HeaderIconButton extends StatelessWidget {
  final String iconPath;
  final void Function() onTap;
  final double? iconWidth;
  final double? iconHeight;
  final Color? iconColor;
  final Color? buttonBackGroundColor;
  const HeaderIconButton({Key? key, required this.iconPath, required this.onTap, this.iconWidth, this.iconHeight, this.iconColor, this.buttonBackGroundColor,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60.h,
      width: 60.w,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.zero,alignment: Alignment.center,
          side: const BorderSide(color: Colors.transparent),
          foregroundColor: AppColors.greyColor,
          backgroundColor: buttonBackGroundColor??AppColors.greySearchTextFilledColor,
          shape: const CircleBorder(),
          elevation: 0,
          shadowColor: Colors.transparent
        ),
        onPressed: onTap,
        child: Center(
          child: SvgPicture.asset(
            iconPath,
            width: iconWidth ?? 26.w,
            height: iconHeight ?? 26.h,
            colorFilter: ColorFilter.mode(
              iconColor??AppColors.greyColor,
              BlendMode.srcIn,
            ),
          ),
        ),
      ),
    );
  }
}
