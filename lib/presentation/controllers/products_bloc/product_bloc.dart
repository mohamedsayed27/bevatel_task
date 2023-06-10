import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/presentation/controllers/products_bloc/product_event.dart';
import 'package:untitled/presentation/controllers/products_bloc/product_state.dart';

import '../../../core/base_usecases/base_usecase.dart';
import '../../../domain/entities/product_details_entity.dart';
import '../../../domain/entities/product_entity.dart';
import '../../../domain/usecases/product_usecase/get_all_product_usecase.dart';
import '../../../domain/usecases/product_usecase/get_product_details_usecase.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  static ProductBloc get(context) => BlocProvider.of(context);
  List<GetAllProductsEntity> allProductsList =[];
  GetProductDetailsEntity? getProductDetailsEntity;
  final GetAllProductUsecase getAllProductUsecase;
  final GetProductDetailsUsecase getProductDetailsUsecase;

  ProductBloc( {required this.getProductDetailsUsecase,required this.getAllProductUsecase}) : super(ProductInitial()) {

    on<GetAllProductEvent>((event, emit) async{
      emit(GetAllProductsLoading());
      try{
        final response = await getAllProductUsecase(const NoParameters());
        if(allProductsList.isEmpty){
          allProductsList=response;
        }else{
          allProductsList.addAll(response);
        }
        emit(GetAllProductsSucess());
      }catch(error){
        emit(GetAllProductsError(error.toString()));
      }
    });

    on<GetProductDetailsEvent>((event, emit) async{
      emit(GetProductDetailsLoading());
      try{
        final response = await getProductDetailsUsecase(event.id);
        getProductDetailsEntity = response;
        emit(GetProductDetailsSucess());
      }catch(error){
        emit(GetProductDetailsError(error.toString()));
      }
    });
  }
}
