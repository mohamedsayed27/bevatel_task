import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled/core/app_router/app_router.dart';
import 'package:untitled/core/app_router/screens_name.dart';
import 'package:untitled/presentation/controllers/cart_cubit/cart_cubit.dart';
import 'package:untitled/presentation/controllers/products_bloc/product_bloc.dart';
import 'package:untitled/presentation/controllers/products_bloc/product_event.dart';

import 'bloc_observer.dart';
import 'core/network/dio_helper.dart';
import 'core/services/services_locator.dart';
import 'core/theme/app_colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DioHelper.init();
  ServicesLocator().init();
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
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
            ),BlocProvider(
              create: (_) => CartCubit(sl(),sl()),
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
            // home: AllProductsScreen(),
          )),
    );
  }
}
