import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/core/base_usecases/base_usecase.dart';

import '../../../domain/entities/get_user_cart_entity.dart';
import '../../../domain/usecases/cart_usecases/get_user_cart_usecase.dart';
import 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  final GetUserCartUsecase _getUserCartUsecase;
  CartCubit(this._getUserCartUsecase) : super(CartInitial());
  static CartCubit get(context) => BlocProvider.of(context);

  List<GetUserCartEntity> userCartList =[];

  void getUserCart()async{
    emit(GetUserCartLoading());
    try{
      userCartList = await _getUserCartUsecase(const NoParameters());
      emit(GetUserCartSuccess());
    }catch(error){
      emit(GetUserCartError(error.toString()));
    }
  }

}
