import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/assets_path/fonts_path.dart';
import '../../../core/theme/app_colors.dart';

class BackButtonAndRatingWidget extends StatelessWidget {
  const BackButtonAndRatingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 18.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: 50.h,
            width: 50.w,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.zero,
                  alignment: Alignment.center,
                  side: const BorderSide(color: Colors.transparent),
                  foregroundColor: AppColors.greyColor,
                  backgroundColor:
                  AppColors.greySearchTextFilledColor,
                  shape: const CircleBorder(),
                  fixedSize: Size(25.w, 25.h)),
              onPressed: () {
                Navigator.pop(context);
              },
              child: Center(
                child: Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: AppColors.greyColor,
                  size: 24.r,
                ),
              ),
            ),
          ),
          Container(
            height: 30.h,
            width: 50.w,
            decoration: BoxDecoration(
              color: AppColors.greySearchTextFilledColor,
              borderRadius: BorderRadius.circular(10.r),
              boxShadow: [
                BoxShadow(
                    offset: Offset(2.w, 4.h),
                    blurRadius: 6.r,
                    color: Colors.black.withOpacity(0.19)),
                BoxShadow(
                    offset: Offset(-2.w, -4.h),
                    blurRadius: 6.r,
                    color: Colors.black.withOpacity(0.09))
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "4.5",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12.sp,
                    fontFamily: FontsPath.poppinsMedium,
                  ),
                ),
                Icon(
                  Icons.star,
                  color: Colors.yellow,
                  size: 23.r,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
