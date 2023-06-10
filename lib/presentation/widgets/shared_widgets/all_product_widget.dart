import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../../../core/assets_path/fonts_path.dart';
import '../../../core/theme/app_colors.dart';
import '../../../domain/entities/product_entity.dart';

class AllProductItem extends StatelessWidget {
  final GetAllProductsEntity getAllProductsEntity;
  const AllProductItem({Key? key,required this.getAllProductsEntity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 15.h,horizontal: 10.w),
      child: Row(
        children: [
          Container(
            height: 150.h,
            width: 150.w,
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
              child:
              CachedNetworkImage(
                  fit: BoxFit.contain,
                  imageUrl:
                  getAllProductsEntity.image!,
                  placeholder: (context, url) =>
                      Shimmer.fromColors(
                        baseColor: Colors.grey[400]!,
                        highlightColor: Colors.grey[300]!,
                        child: Container(
                          height: double.infinity,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius:
                            BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                  errorWidget: (context, url, error) =>
                  const Icon(Icons.error)),
            ),
          ),
          SizedBox(width: 20.w,),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  getAllProductsEntity.title!,
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: FontsPath.poppinsMedium,
                    fontSize: 15.sp,
                  ),
                ),
                SizedBox(height: 2.h,),
                Text(
                  "\$${getAllProductsEntity.price}",
                  style: TextStyle(
                    color: AppColors.orangeColor,
                    fontFamily: FontsPath.poppinsMedium,
                    fontSize: 14.sp,
                  ),
                ),
                SizedBox(height: 10.h,),
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
                        "${getAllProductsEntity.rating!.rate}",
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
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
