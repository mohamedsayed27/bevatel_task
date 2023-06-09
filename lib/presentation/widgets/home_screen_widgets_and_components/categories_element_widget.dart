import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/assets_path/fonts_path.dart';
import '../../../core/dummy_data/home_dummy_data.dart';
import '../../../core/theme/app_colors.dart';

class CategoriesItemWidget extends StatelessWidget {
  final int index;
  const CategoriesItemWidget({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: 70.h,
          width: 60.w,
          decoration: BoxDecoration(
            color: AppColors.lightOrangeColor.withOpacity(0.3),
            borderRadius: BorderRadius.circular(15.r),
          ),
          child: Center(
            child: SvgPicture.asset(
              HomeDummyData.categoriesDummyList[index]['icon'],
              width: 28.w,
              height: 28.h,
              colorFilter: const ColorFilter.mode(
                AppColors.orangeColor,
                BlendMode.srcIn,
              ),
            ),
          ),
        ),
        SizedBox(height: 10.h,),
        Expanded(
          child: Text(
            HomeDummyData.categoriesDummyList[index]['title'],
            style: TextStyle(
              color: Colors.black,
              fontSize: 14.sp,
              fontFamily: FontsPath.poppinsMedium,
            ),
          ),
        )
      ],
    );
  }
}
