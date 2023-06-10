import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled/presentation/controllers/products_bloc/product_bloc.dart';
import 'package:untitled/presentation/controllers/products_bloc/product_state.dart';

import '../../core/app_router/screens_name.dart';
import '../../core/constants/constants.dart';
import '../controllers/cart_cubit/cart_cubit.dart';
import '../controllers/products_bloc/product_event.dart';
import '../widgets/shared_widgets/all_product_widget.dart';
import '../widgets/shared_widgets/custom_app_bar.dart';


class AllProductsScreen extends StatefulWidget {
  const AllProductsScreen({Key? key}) : super(key: key);

  @override
  State<AllProductsScreen> createState() => _AllProductsScreenState();
}

class _AllProductsScreenState extends State<AllProductsScreen> {
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    var cubit = ProductBloc.get(context);
    scrollController.addListener(() {
      if (scrollController.position.maxScrollExtent ==
          scrollController.offset) {
        cubit.add(GetAllProductEvent());
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocConsumer<ProductBloc, ProductState>(
        listener: (context, state) {
          var cubit = ProductBloc.get(context);
          if (state is GetProductDetailsLoading) {
            showProgressIndicator(context);
          }
          if (state is GetProductDetailsSucess) {
            Navigator.pop(context);
            Navigator.pop(context);
            CartCubit.get(context).count = 1;
            Navigator.pushNamed(
              context,
              ScreenName.productDetails,
              arguments: cubit.getProductDetailsEntity,
            );
          }
        },
        builder: (context, state) {
          var cubit = ProductBloc.get(context);
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: PreferredSize(
              preferredSize: Size(double.infinity, 70.h),
              child: CustomCartAppBar(
                itemsNumber: '${cubit.allProductsList.length}', title: 'All Products',),
            ),
            body: ListView.builder(itemBuilder: (BuildContext context, int index) { return InkWell(onTap: (){
              cubit.add(
                GetProductDetailsEvent(
                  id: cubit.allProductsList[index].id!,
                ),
              );
            },child: AllProductItem(getAllProductsEntity: cubit.allProductsList[index],)); },itemCount: cubit.allProductsList.length,controller: scrollController,),
          );
        },
      ),
    );
  }
}
