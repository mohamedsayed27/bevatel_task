import 'package:get_it/get_it.dart';
import 'package:untitled/data/data_source/products_data_source.dart';
import 'package:untitled/data/repository/product_repository.dart';

import '../../domain/repostiory/product_base_repository.dart';
import '../../domain/usecases/product_usecase/get_all_product_usecase.dart';
import '../../domain/usecases/product_usecase/get_product_details_usecase.dart';
import '../../presentation/controllers/products_bloc/product_bloc.dart';
import '../network/dio_helper.dart';

final sl = GetIt.instance;
class ServicesLocator{

  void init(){

    ///---------------BLoC---------------

    sl.registerFactory(() => ProductBloc(getProductDetailsUsecase: sl(), getAllProductUsecase: sl()));





    ///---------------USE CASES---------------
    sl.registerLazySingleton(() => GetAllProductUsecase(productBaseRepository: sl()));
    sl.registerLazySingleton(() => GetProductDetailsUsecase(productBaseRepository: sl()));
    


    ///---------------REPOSITORY--------------->>>>
    sl.registerLazySingleton<ProductBaseRepository>(() => ProductRepository(productsRemoteDataSource: sl()));


    ///---------------DATA SOURCE--------------->>>
    sl.registerLazySingleton<ProductsBaseRemoteDataSource>(() => ProductsRemoteDataSource(dioHelper: sl()));



    ///---------------Network--------------->>>>>
    sl.registerLazySingleton(() => DioHelper());


  }
}