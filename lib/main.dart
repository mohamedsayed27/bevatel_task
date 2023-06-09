import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled/core/app_router/app_router.dart';
import 'package:untitled/core/app_router/screens_name.dart';
import 'package:untitled/data/data_source/products_data_source.dart';
import 'package:untitled/presentation/controllers/products_bloc/product_bloc.dart';
import 'package:untitled/presentation/controllers/products_bloc/product_event.dart';
import 'package:untitled/presentation/screens/cart_screen.dart';

import 'core/network/dio_helper.dart';
import 'core/services/services_locator.dart';
import 'core/theme/app_colors.dart';
import 'data/data_source/cart_remote_data_source.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DioHelper.init();
  ServicesLocator().init();
  getP();
  runApp(const MyApp());
}

void getP() async {
  CartRemoteDataSource productsRemoteDataSource =
      CartRemoteDataSource(dioHelper: sl());
  await productsRemoteDataSource.getUserCart();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(428, 926),
      builder: (BuildContext context, Widget? child) => MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (_) => ProductBloc(
                getProductDetailsUsecase: sl(),
                getAllProductUsecase: sl(),
              )..add(GetAllProductEvent()),
            ),
          ],
          child: MaterialApp(
            title: 'Bevatel Task',
            theme: ThemeData(
              primarySwatch:
                  AppColors.createMaterialColor(AppColors.orangeColor),
            ),
            onGenerateRoute: AppRouter.generateRoute,
            initialRoute: ScreenName.splashscreen,
            // home: CartScreen(),
          )),
    );
  }
}
