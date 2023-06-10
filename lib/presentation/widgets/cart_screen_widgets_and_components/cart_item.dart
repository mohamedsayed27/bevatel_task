import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/assets_path/fonts_path.dart';
import '../../../core/theme/app_colors.dart';

class CartItem extends StatelessWidget {
  final String image;
  final String productTitle;
  final String productCount;
  final String productPrice;
  const CartItem({Key? key, required this.image, required this.productTitle, required this.productCount, required this.productPrice}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: Row(
        children: [
          Container(
            height: 100.h,
            width: 100.w,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15.r),
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
          SizedBox(width: 20.w,),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  productTitle,
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: FontsPath.poppinsMedium,
                    fontSize: 16.sp,
                  ),
                ),
                Text(
                  "${productCount}x",
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: FontsPath.poppinsLight,
                    fontSize: 14.sp,
                  ),
                ),
                Text(
                  "\$$productPrice",
                  style: TextStyle(
                    color: AppColors.orangeColor,
                    fontFamily: FontsPath.poppinsMedium,
                    fontSize: 16.sp,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
