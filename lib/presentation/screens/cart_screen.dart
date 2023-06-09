import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled/core/assets_path/svg_path.dart';
import 'package:untitled/core/theme/app_colors.dart';

import '../../core/assets_path/fonts_path.dart';
import '../../core/dummy_data/cart_dummy_data.dart';
import '../widgets/cart_screen_widgets_and_components/cart_item.dart';
import '../widgets/cart_screen_widgets_and_components/custom_app_bar.dart';
import '../widgets/home_screen_widgets_and_components/header_icon_button.dart';
import '../widgets/shared_widgets/custom_button.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: Size(double.infinity, 70.h),
          child: const CustomCartAppBar(),
        ),
        body: Column(
          children: [
            SizedBox(
              height: 20.h,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: CartDummyData.cartList.length,
                itemBuilder: (BuildContext context, int cartIndex) {
                  return Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 10.h, horizontal: 18.w),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          CartDummyData.cartList[cartIndex]["title"],
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
                          itemCount:
                              CartDummyData.cartList[cartIndex]["items"].length,
                          itemBuilder: (BuildContext context, int index) {
                            return Dismissible(
                              onDismissed: (di) {
                              },
                              background: Container(
                                padding: EdgeInsets.only(right: 15.r),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15.r),
                                  color: AppColors.pinkColor.withOpacity(0.3),
                                ),
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: Icon(Icons.delete_outline_sharp,color: AppColors.pinkColor,),
                                ),
                              ),
                              direction: DismissDirection.endToStart,
                              key: const ValueKey(1),
                              child: CartItem(
                                image: CartDummyData.cartList[cartIndex]["items"]
                                    [index]["productImage"],
                                productTitle: CartDummyData.cartList[cartIndex]
                                    ["items"][index]["productTitle"],
                                productCount: CartDummyData.cartList[cartIndex]
                                    ["items"][index]["count"],
                                productPrice: CartDummyData.cartList[cartIndex]
                                    ["items"][index]["price"],
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
                        SizedBox(height: 10.h,),
                        Text(
                          "total : ",
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: FontsPath.poppinsLight,
                            fontSize: 12.sp,
                          ),
                        ),
                        SizedBox(height: 10.h,),
                        Text(
                          "\$950",
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
                        SizedBox(height: 10.h,),
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
      ),
    );
  }
}
