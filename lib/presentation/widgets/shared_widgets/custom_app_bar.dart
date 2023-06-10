import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/assets_path/fonts_path.dart';

class CustomCartAppBar extends StatelessWidget {
  final String itemsNumber;
  final String title;
  const CustomCartAppBar({Key? key, required this.itemsNumber, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      centerTitle: true,
      leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.black,
            size: 22.r,
          )),
      title: Column(
        children: [
          Text(
            title,
            style: TextStyle(
              color: Colors.black,
              fontFamily: FontsPath.poppinsMedium,
              fontSize: 16.sp,
            ),
          ),
          Text(
            "$itemsNumber Items",
            style: TextStyle(
              color: Colors.black,
              fontFamily: FontsPath.poppinsLight,
              fontSize: 12.sp,
            ),
          ),
        ],
      ),
    );
  }
}
