import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled/core/app_router/screens_name.dart';
import 'package:untitled/core/constants/constants.dart';
import 'package:untitled/presentation/controllers/cart_cubit/cart_cubit.dart';
import 'package:untitled/presentation/widgets/home_screen_widgets_and_components/search_text_field_widget.dart';

import '../../../core/assets_path/svg_path.dart';
import '../../controllers/cart_cubit/cart_state.dart';
import 'header_icon_button.dart';

class SearchBarAndCartAndNotificationComponent extends StatelessWidget {
  const SearchBarAndCartAndNotificationComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20.h, left: 18.w, right: 10.w),
      child: SizedBox(
        height: 70.h,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(top: 6.h),
                child: const SearchTextField(
                  hintText: 'Search product',
                ),
              ),
            ),
            SizedBox(
              width: 5.w,
            ),
            BlocConsumer<CartCubit, CartState>(
              listener: (context, state) {
                if(state is GetUserCartLoading){
                  showProgressIndicator(context);
                }
                if(state is GetUserCartSuccess){
                  Navigator.pop(context);
                  Navigator.pushNamed(context, ScreenName.cartScreen);
                }
              },
              builder: (context, state) {
                var cubit = CartCubit.get(context);
                return HeaderIconButton(
                  iconPath: SvgPath.cart,
                  onTap: () {
                    if(cubit.userCartList.isEmpty){
                      cubit.getUserCart();
                    }else{
                      Navigator.pushNamed(context, ScreenName.cartScreen);
                    }
                  },
                );
              },
            ),
            HeaderIconButton(
              iconPath: SvgPath.notification,
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
