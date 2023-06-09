import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/assets_path/fonts_path.dart';
import '../../../core/theme/app_colors.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final void Function()? onTap;
  final double? width;
  final double? height;
  const CustomButton({Key? key, required this.title, this.onTap, this.width, this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height??60.h,
      width: width??200.w,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.zero,
          alignment: Alignment.center,
          side:
          const BorderSide(color: Colors.transparent),
          foregroundColor: AppColors.whitColor,
          backgroundColor: AppColors.orangeColor,
          shadowColor: Colors.transparent,
          elevation: 0,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.r)),
        ),
        onPressed: onTap,
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 14.sp,
              fontFamily: FontsPath.poppinsMedium,
            ),
          ),
        ),
      ),
    );
  }
}
