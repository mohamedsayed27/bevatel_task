import 'package:get_it/get_it.dart';
import 'package:untitled/data/data_source/cart_remote_data_source.dart';
import 'package:untitled/data/data_source/products_data_source.dart';
import 'package:untitled/data/repository/cart_repository.dart';
import 'package:untitled/data/repository/product_repository.dart';
import 'package:untitled/domain/repostiory/cart_base_repository.dart';
import 'package:untitled/domain/usecases/cart_usecases/get_user_cart_usecase.dart';
import 'package:untitled/presentation/controllers/cart_cubit/cart_cubit.dart';

import '../../domain/repostiory/product_base_repository.dart';
import '../../domain/usecases/cart_usecases/add_to_cart_usecase.dart';
import '../../domain/usecases/product_usecase/get_all_product_usecase.dart';
import '../../domain/usecases/product_usecase/get_product_details_usecase.dart';
import '../../presentation/controllers/products_bloc/product_bloc.dart';
import '../network/dio_helper.dart';

final sl = GetIt.instance;
class ServicesLocator{

  void init(){

    ///---------------BLoC---------------

    sl.registerFactory(() => ProductBloc(getProductDetailsUsecase: sl(), getAllProductUsecase: sl()));
    sl.registerFactory(() => CartCubit(sl(),sl()));





    ///---------------USE CASES---------------
    sl.registerLazySingleton(() => GetAllProductUsecase(productBaseRepository: sl()));
    sl.registerLazySingleton(() => GetProductDetailsUsecase(productBaseRepository: sl()));
    sl.registerLazySingleton(() => GetUserCartUsecase(cartBaseRepository: sl()));
    sl.registerLazySingleton(() => AddToCartUsecase(cartBaseRepository: sl()));



    ///---------------REPOSITORY--------------->>>>
    sl.registerLazySingleton<ProductBaseRepository>(() => ProductRepository(productsRemoteDataSource: sl()));
    sl.registerLazySingleton<CartBaseRepository>(() => CartRepository(cartRemoteBaseDataSource: sl()));


    ///---------------DATA SOURCE--------------->>>
    sl.registerLazySingleton<ProductsBaseRemoteDataSource>(() => ProductsRemoteDataSource(dioHelper: sl()));
    sl.registerLazySingleton<CartRemoteBaseDataSource>(() => CartRemoteDataSource(dioHelper: sl()));



    ///---------------Network--------------->>>>>
    sl.registerLazySingleton(() => DioHelper());


  }
}