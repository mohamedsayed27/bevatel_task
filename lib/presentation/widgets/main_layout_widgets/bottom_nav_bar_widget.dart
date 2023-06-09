import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/assets_path/svg_path.dart';
import '../../../core/theme/app_colors.dart';
import 'bottom_nav_bar_icon_widget.dart';

class BottomNavBarWidget extends StatefulWidget {
  final int selectedIndex;
  final void Function(int index) onChanged;

  const BottomNavBarWidget(
      {Key? key, required this.selectedIndex, required this.onChanged})
      : super(key: key);

  @override
  State<BottomNavBarWidget> createState() => _BottomNavBarWidgetState();
}

class _BottomNavBarWidgetState extends State<BottomNavBarWidget> {
  late int currentIndex;

  @override
  void initState() {
    currentIndex = widget.selectedIndex;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.whitColor,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(50.r),
          topLeft: Radius.circular(50.r),
        ),
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
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          BottomNavBarIcon(
            onTap: () {
              currentIndex = 0;
              widget.onChanged(currentIndex);
            },
            index: 0,
            currentIndex: currentIndex,
            iconPath: SvgPath.store,
          ),
          BottomNavBarIcon(
            onTap: () {
              currentIndex = 1;
              widget.onChanged(currentIndex);
            },
            index: 1,
            currentIndex: currentIndex,
            iconPath: SvgPath.favorite,
          ),
          BottomNavBarIcon(
            onTap: () {
              currentIndex = 2;
              widget.onChanged(currentIndex);
            },
            index: 2,
            currentIndex: currentIndex,
            iconPath: SvgPath.message,
          ),
          BottomNavBarIcon(
            onTap: () {
              currentIndex = 3;
              widget.onChanged(currentIndex);
            },
            index: 3,
            currentIndex: currentIndex,
            iconPath: SvgPath.user,
          ),
        ],
      ),
    );
  }
}
