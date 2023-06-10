import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled/core/assets_path/images_path.dart';
import 'package:untitled/core/assets_path/svg_path.dart';
import 'package:untitled/core/theme/app_colors.dart';

import '../../core/assets_path/fonts_path.dart';
import '../../core/dummy_data/cart_dummy_data.dart';
import '../controllers/cart_cubit/cart_cubit.dart';
import '../controllers/cart_cubit/cart_state.dart';
import '../widgets/cart_screen_widgets_and_components/cart_item.dart';
import '../widgets/cart_screen_widgets_and_components/custom_app_bar.dart';
import '../widgets/home_screen_widgets_and_components/header_icon_button.dart';
import '../widgets/shared_widgets/custom_button.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocConsumer<CartCubit, CartState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          var cubit = CartCubit.get(context);
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: PreferredSize(
              preferredSize: Size(double.infinity, 70.h),
              child: CustomCartAppBar(itemsNumber: '${cubit.cartItemsNumberCount}',),
            ),
            body: Column(
              children: [
                SizedBox(
                  height: 20.h,
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: cubit.userCartList.length,
                    itemBuilder: (BuildContext context, int cartIndex) {
                      return Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 10.h, horizontal: 18.w),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Cart Number ${cartIndex+1}",
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: FontsPath.poppinsMedium,
                                fontSize: 16.sp,
                              ),
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: cubit.userCartList[cartIndex].products!.length,
                              itemBuilder: (BuildContext context,
                                  int index) {
                                return Dismissible(
                                  onDismissed: (di) {
                                    cubit.deleteItemFromCartList(cartProIndex: cartIndex, index: index);
                                  },
                                  background: Container(
                                    padding: EdgeInsets.only(right: 15.r),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                          15.r),
                                      color:
                                      AppColors.pinkColor.withOpacity(0.3),
                                    ),
                                    child: const Align(
                                      alignment: Alignment.centerRight,
                                      child: Icon(
                                        Icons.delete_outline_sharp,
                                        color: AppColors.pinkColor,
                                      ),
                                    ),
                                  ),
                                  direction: DismissDirection.endToStart,
                                  key: ValueKey(cubit.userCartList[cartIndex].products![index]),
                                  child: CartItem(
                                    image: ImagesPath.p1,
                                    productTitle: "Product id Number ${cubit.userCartList[cartIndex].products![index].productId}",
                                    productCount: "Product quantity Number ${cubit.userCartList[cartIndex].products![index].quantity}",
                                    productPrice:"${(cubit.userCartList[cartIndex].products![index].price!*cubit.userCartList[cartIndex].products![index].quantity!)} \$",
                                  ),
                                );
                              },
                            )
                          ],
                        ),
                      );
                    },
                  ),
                ),
                Container(
                  height: 200.h,
                  width: double.infinity,
                  color: Colors.white,
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            HeaderIconButton(
                              iconPath: SvgPath.bill,
                              onTap: () {},
                              iconColor: AppColors.orangeColor,
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Text(
                              "total : ",
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: FontsPath.poppinsLight,
                                fontSize: 12.sp,
                              ),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Text(
                              "\$ ${cubit.totalPrice}",
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: FontsPath.poppinsBold,
                                fontSize: 14.sp,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Add Voucher Code",
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontFamily: FontsPath.poppinsMedium,
                                    fontSize: 14.sp,
                                  ),
                                ),
                                Icon(
                                  Icons.arrow_forward_ios_rounded,
                                  color: Colors.grey,
                                  size: 22.r,
                                )
                              ],
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            CustomButton(
                              title: "Check Out",
                              onTap: () {},
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
