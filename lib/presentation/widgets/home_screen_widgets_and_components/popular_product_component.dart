import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:untitled/presentation/controllers/products_bloc/product_bloc.dart';
import 'package:untitled/presentation/controllers/products_bloc/product_state.dart';

import '../../../core/assets_path/fonts_path.dart';
import '../../controllers/products_bloc/product_event.dart';

class PopularProductComponent extends StatelessWidget {
  const PopularProductComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 20.h),
      child: SizedBox(
        height: 250.h,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "Popular product",
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: FontsPath.poppinsMedium,
                    fontSize: 18.sp,
                  ),
                ),
                Text(
                  "See more",
                  style: TextStyle(
                    color: Colors.grey.shade600,
                    fontFamily: FontsPath.poppinsLight,
                    fontSize: 14.sp,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 15.h,
            ),
            BlocConsumer<ProductBloc, ProductState>(
              listener: (context, state) {

              },
              builder: (context, state) {
                var cubit = ProductBloc.get(context);
                return Expanded(
                  child: state is! GetProductDetailsLoading?ListView.builder(
                    padding: EdgeInsets.zero,
                    scrollDirection: Axis.horizontal,
                    itemCount: cubit.allProductsList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.w, vertical: 10.h),
                        child: InkWell(
                          onTap: () {
                            cubit.add(GetProductDetailsEvent(id: cubit.allProductsList[index].id!));
                            // Navigator.pushNamed(
                            //     context, ScreenName.productDetails,
                            //     arguments: HomeDummyData.productList[index]);
                          },
                          child: Container(
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
                            child: CachedNetworkImage(
                              fit: BoxFit.cover,
                              imageUrl: cubit.allProductsList[index].image!,
                              placeholder: (context, url) => Shimmer.fromColors(
                                baseColor: Colors.grey[400]!,
                                highlightColor: Colors.grey[300]!,
                                child: Container(
                                  height: double.infinity,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                              ),
                              errorWidget: (context, url, error) =>
                                  const Icon(Icons.error),
                            ),
                          ),
                        ),
                      );
                    },
                  ):ListView.builder(
                    padding: EdgeInsets.zero,
                    scrollDirection: Axis.horizontal,
                    itemCount: 3,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.w, vertical: 10.h),
                        child: Container(
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
                          child: Shimmer.fromColors(
                            baseColor: Colors.grey[400]!,
                            highlightColor: Colors.grey[300]!,
                            child: Container(
                              height: double.infinity,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
