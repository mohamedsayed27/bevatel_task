import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/assets_path/fonts_path.dart';
import '../../../core/assets_path/images_path.dart';

class SpecialItemWidget extends StatelessWidget {
  const SpecialItemWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 10.h),
      child: Stack(
        alignment: Alignment.centerLeft,
        children: [
          Container(
            height: 120.h,
            width: 300.w,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(27.r),
            ),
            child: Image.asset(
              ImagesPath.productsBackground,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            height: 120.h,
            width: 300.w,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            decoration: BoxDecoration(
              color: Colors.black38,
              borderRadius: BorderRadius.circular(27.r),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Smart phones",
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: FontsPath.poppinsMedium,
                      fontSize: 14.sp),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Text(
                  "18 Brands",
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: FontsPath.poppinsLight,
                      fontSize: 12.sp),
                ),

              ],
            ),
          )
        ],
      ),
    );
  }
}
