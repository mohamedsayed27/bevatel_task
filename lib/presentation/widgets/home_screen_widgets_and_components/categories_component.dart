import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/dummy_data/home_dummy_data.dart';
import 'categories_element_widget.dart';

class CategoriesComponent extends StatelessWidget {
  const CategoriesComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150.h,
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 18.w,vertical: 20.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: List.generate(HomeDummyData.categoriesDummyList.length, (index) => CategoriesItemWidget(index: index,),),
        ),
      ),
    );
  }
}
