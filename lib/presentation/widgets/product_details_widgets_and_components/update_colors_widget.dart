import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled/presentation/controllers/cart_cubit/cart_cubit.dart';
import 'package:untitled/presentation/controllers/cart_cubit/cart_state.dart';

import '../../../core/assets_path/fonts_path.dart';
import '../../../core/theme/app_colors.dart';
import 'color_component_item.dart';

class UpdateColorWidget extends StatefulWidget {
  const UpdateColorWidget({Key? key}) : super(key: key);

  @override
  State<UpdateColorWidget> createState() => _UpdateColorWidgetState();
}

class _UpdateColorWidgetState extends State<UpdateColorWidget> {
  List<Color> colorList = [
    Colors.purpleAccent,
    Colors.pink,
    Colors.purple,
    Colors.blue,
  ];
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180.h,
      width: double.infinity,
      padding: EdgeInsets.only(
        top: 10.h,
        left: 15.w,
        right: 20.w,
      ),
      decoration: BoxDecoration(
        color: AppColors.greyColor.withOpacity(0.3),
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(50.r),
          topLeft: Radius.circular(50.r),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: List.generate(
              colorList.length,
                  (index) =>
                  ColorComponentItem(
                    index: index,
                    currentIndex: currentIndex,
                    color: colorList[index],
                    onTap: () {
                      setState(() {
                        currentIndex = index;
                      });
                    },
                  ),
            ),
          ),
          BlocConsumer<CartCubit, CartState>(
            listener: (context, state) {
              // TODO: implement listener
            },
            builder: (context, state) {
              var cubit = CartCubit.get(context);
              return Row(
                children: [
                  SizedBox(
                    height: 40.h,
                    width: 40.w,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.zero,
                          alignment: Alignment.center,
                          side: const BorderSide(color: Colors.transparent),
                          foregroundColor: AppColors.greyColor,
                          backgroundColor: AppColors.whitColor,
                          shape: const CircleBorder(),
                          fixedSize: Size(25.w, 25.h)),
                      onPressed: () {
                        cubit.increaseCount();
                      },
                      child: Center(
                        child: Icon(
                          Icons.add,
                          color: AppColors.greyColor,
                          size: 24.r,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Text("${cubit.count}", style: TextStyle(
                    color: AppColors.lightOrangeColor,
                    fontFamily: FontsPath.poppinsMedium,
                    fontSize: 16.sp,
                  ),),
                  SizedBox(
                    width: 10.w,
                  ),
                  SizedBox(
                    height: 40.h,
                    width: 40.w,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.zero,
                        alignment: Alignment.center,
                        side: const BorderSide(color: Colors.transparent),
                        foregroundColor: AppColors.greyColor,
                        backgroundColor: AppColors.whitColor,
                        shape: const CircleBorder(),
                        fixedSize: Size(25.w, 25.h),
                      ),
                      onPressed: () {
                        cubit.decreaseCount();
                      },
                      child: Center(
                        child: Icon(
                          Icons.remove,
                          color: AppColors.greyColor,
                          size: 24.r,
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
