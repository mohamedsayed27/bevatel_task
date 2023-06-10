import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled/domain/entities/product_details_entity.dart';
import 'package:untitled/presentation/controllers/cart_cubit/cart_cubit.dart';
import 'package:untitled/presentation/controllers/cart_cubit/cart_state.dart';

import '../../core/assets_path/fonts_path.dart';
import '../../core/theme/app_colors.dart';
import '../../domain/usecases/cart_usecases/add_to_cart_usecase.dart';
import '../widgets/product_details_widgets_and_components/product_details_header_component.dart';
import '../widgets/product_details_widgets_and_components/update_colors_widget.dart';
import '../widgets/shared_widgets/custom_button.dart';

class ProductDetailsScreen extends StatelessWidget {
  final GetProductDetailsEntity product;

  const ProductDetailsScreen({Key? key, required this.product})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              height: double.infinity,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: AppColors.whitColor,
              ),
              child: ProductDetailsHeaderComponent(
                image: product.image!, rate: 4.2,
              ),
            ),
            Container(
              height: 550.h,
              width: double.infinity,
              padding: EdgeInsets.only(top: 30.h),
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
                    color: Colors.black.withOpacity(0.19),
                  ),
                  BoxShadow(
                    offset: Offset(-2.w, -4.h),
                    blurRadius: 6.r,
                    color: Colors.black.withOpacity(0.09),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 15.w),
                    child: Text(product.title!,
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: FontsPath.poppinsMedium,
                        fontSize: 24.sp,),),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      height: 50.h,
                      width: 60.w,
                      decoration: BoxDecoration(
                        color: AppColors.pinkColor.withOpacity(0.3),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15.r),
                          bottomLeft: Radius.circular(15.r),
                        ),
                      ),
                      child: Center(
                        child: Icon(
                          Icons.favorite,
                          color: AppColors.pinkColor,
                          size: 23.r,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 15.w,
                      ),
                      child: Text(
                        product.description!,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: FontsPath.poppinsLight,
                          fontSize: 16.sp,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 15.w),
                    child: Row(
                      children: [
                        Text(
                          "See More Details",
                          style: TextStyle(
                            color: AppColors.lightOrangeColor,
                            fontFamily: FontsPath.poppinsMedium,
                            fontSize: 14.sp,
                          ),
                        ),
                        Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: AppColors.lightOrangeColor,
                          size: 22.r,
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      const UpdateColorWidget(),
                      Container(
                        height: 105.h,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: AppColors.whitColor,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(50.r),
                            topLeft: Radius.circular(50.r),
                          ),
                        ),
                        child: Center(
                          child: SizedBox(
                            height: 60.h,
                            width: 200.w,
                            child: BlocConsumer<CartCubit, CartState>(
                              listener: (context, state) {
                                // TODO: implement listener
                              },
                              builder: (context, state) {
                                var cubit = CartCubit.get(context);
                                return CustomButton(
                                  title: "Add to Cart", onTap: () {
                                  cubit.addToCart(addToCartParameters: AddToCartParameters(productId: product.id!, productCount: cubit.count));
                                },);
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
