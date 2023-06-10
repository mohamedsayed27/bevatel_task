import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/core/base_usecases/base_usecase.dart';
import 'package:untitled/domain/entities/add_to_cart_entity.dart';
import 'package:untitled/domain/usecases/cart_usecases/add_to_cart_usecase.dart';

import '../../../domain/entities/get_user_cart_entity.dart';
import '../../../domain/usecases/cart_usecases/get_user_cart_usecase.dart';
import 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  final GetUserCartUsecase _getUserCartUsecase;
  final AddToCartUsecase _addToCartUsecase;
  CartCubit(this._getUserCartUsecase, this._addToCartUsecase) : super(CartInitial());
  static CartCubit get(context) => BlocProvider.of(context);

  List<GetUserCartEntity> userCartList =[];

  AddToCartEntity? addToCartEntity;
  int cartItemsNumberCount = 0;
  int totalPrice = 0;
  void getUserCart()async{
    emit(GetUserCartLoading());
    try{
      userCartList = await _getUserCartUsecase(const NoParameters());
      getCartItemsNumber();
      getTotalPrice();
      emit(GetUserCartSuccess());
    }catch(error){
      emit(GetUserCartError(error.toString()));
    }
  }

  int count = 0;
  void increaseCount(){
    count++;
    emit(IncreaseCountSuccess());
  }
  void decreaseCount(){
    if(count>0){
      count--;
      emit(DecreaseCountSuccess());
    }
  }
  void getCartItemsNumber(){
    for (var e in userCartList) {
      cartItemsNumberCount =cartItemsNumberCount+e.products!.length;
    }
  }

  void getTotalPrice(){
     for (var e in userCartList) {
       for (var e in e.products!) {
         totalPrice += e.price!*e.quantity!;
       }
     }
  }

  void deleteItemFromCartList({required int cartProIndex, required int index}){
    userCartList[cartProIndex].products!.removeAt(index);
    if(userCartList[cartProIndex].products!.isEmpty){
      userCartList.removeAt(cartProIndex);
    }
    cartItemsNumberCount=0;
    totalPrice=0;
    getCartItemsNumber();
    getTotalPrice();
    emit(ItemRemovedSuccessState());
  }

  void addToCart({required AddToCartParameters addToCartParameters})async{
    emit(AddToCartCartLoading());
    try{
      addToCartEntity = await _addToCartUsecase(addToCartParameters);
      emit(AddToCartCartSuccess());
    }catch(error){
      emit(AddToCartCartError(error.toString()));
    }
  }
}
