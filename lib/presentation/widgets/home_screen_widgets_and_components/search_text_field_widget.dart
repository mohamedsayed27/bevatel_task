import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/assets_path/fonts_path.dart';
import '../../../core/theme/app_colors.dart';

class SearchTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController? controller;

  const SearchTextField({
    Key? key,
    required this.hintText,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        counter: const SizedBox.shrink(),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.r),
          borderSide: const BorderSide(
            color: AppColors.greySearchTextFilledColor,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.r),
          borderSide: const BorderSide(
            color: AppColors.greySearchTextFilledColor,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.r),
          borderSide: const BorderSide(
            color: AppColors.greySearchTextFilledColor,
          ),
        ),
        filled: true,
        fillColor: AppColors.greySearchTextFilledColor,
        hintText: hintText,
        hintStyle: TextStyle(
            color: AppColors.greyColor,
            fontSize: 16.sp,
            fontFamily: FontsPath.poppinsMedium),
        prefixIcon: const Icon(
          Icons.search,
          color: AppColors.greyColor,
        ),
        contentPadding: EdgeInsets.only(top:25.h),
      ),
    );
  }
}
