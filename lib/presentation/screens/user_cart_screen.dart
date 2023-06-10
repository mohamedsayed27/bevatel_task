import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:untitled/core/assets_path/svg_path.dart';
import 'package:untitled/core/constants/constants.dart';
import 'package:untitled/core/theme/app_colors.dart';

import '../../core/assets_path/fonts_path.dart';
import '../controllers/cart_cubit/cart_cubit.dart';
import '../controllers/cart_cubit/cart_state.dart';
import '../widgets/cart_screen_widgets_and_components/cart_item.dart';
import '../widgets/shared_widgets/custom_app_bar.dart';
import '../widgets/home_screen_widgets_and_components/header_icon_button.dart';
import '../widgets/shared_widgets/custom_button.dart';

class UserCartScreen extends StatefulWidget {
  const UserCartScreen({Key? key}) : super(key: key);

  @override
  State<UserCartScreen> createState() => _UserCartScreenState();
}

class _UserCartScreenState extends State<UserCartScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocConsumer<CartCubit, CartState>(
        listener: (context, state) {
          var cubit = CartCubit.get(context);
          if(state is CheckOutCartLoading){
            showProgressIndicator(context);
          }
          if(state is CheckOutCartSuccess){
            Navigator.pop(context);
            cubit.userCartList.clear();
            Fluttertoast.showToast(msg: "All Done successfully",backgroundColor: Colors.green);
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          var cubit = CartCubit.get(context);
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: PreferredSize(
              preferredSize: Size(double.infinity, 70.h),
              child: CustomCartAppBar(itemsNumber: '${cubit.userCartList.length}', title: 'Your cart',),
            ),
            body: Column(
              children: [
                SizedBox(
                  height: 20.h,
                ),
                Expanded(
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: cubit.userCartList.length,
                    itemBuilder: (BuildContext context,
                        int index) {
                      return Dismissible(
                        onDismissed: (di) {
                          cubit.deleteFromUserCartList(index: index);
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
                        key: ValueKey(cubit.userCartList[index]),
                        child: CartItem(
                          isUserCart: true,
                          image: cubit.userCartList[index].image!,
                          productTitle: "${cubit.userCartList[index].title}",
                          productCount: "${cubit.userCartList[index].count}",
                          productPrice:"${(cubit.userCartList[index].price!.toInt()*cubit.userCartList[index].count!).toInt()} \$",
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
                              "\$ ${cubit.userCartTotalPrice.toInt()}",
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
                              onTap: () {
                                cubit.checkOutCart();
                              },
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
