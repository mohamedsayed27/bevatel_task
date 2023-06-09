import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/assets_path/fonts_path.dart';
import '../../../core/assets_path/images_path.dart';

class BannerComponent extends StatelessWidget {
  const BannerComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 18.w,vertical: 20.h),
      child: Stack(
        alignment: Alignment.centerLeft,
        children: [
          Container(
            height: 130.h,
            width: double.infinity,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(27.r),
            ),
            child: Image.asset(ImagesPath.background,fit: BoxFit.cover,),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("A summer surprise",style: TextStyle(color: Colors.white,fontFamily: FontsPath.poppinsLight,fontSize: 14.sp),),
                SizedBox(height: 2.h,),
                Text("Cashback  20%",style: TextStyle(color: Colors.white,fontFamily: FontsPath.poppinsMedium,fontSize: 24.sp),),
              ],
            ),
          )
        ],
      ),
    );
  }
}
