import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/core/base_usecases/base_usecase.dart';
import 'package:untitled/domain/entities/add_to_cart_entity.dart';
import 'package:untitled/domain/usecases/cart_usecases/add_to_cart_usecase.dart';

import '../../../domain/entities/get_user_cart_entity.dart';
import '../../../domain/entities/product_details_entity.dart';
import '../../../domain/usecases/cart_usecases/get_user_cart_usecase.dart';
import 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  final GetUserCartUsecase _getUserCartUsecase;
  final AddToCartUsecase _addToCartUsecase;
  CartCubit(this._getUserCartUsecase, this._addToCartUsecase) : super(CartInitial());
  static CartCubit get(context) => BlocProvider.of(context);

  List<GetUserCartEntity> appCartList =[];
  List<GetProductDetailsEntity> userCartList =[];

  AddToCartEntity? addToCartEntity;
  int appCartItemsNumberCount = 0;
  int appCartTotalPrice = 0;
  int userCartItemsNumberCount = 0;
  double userCartTotalPrice = 0;
  void getUserCart()async{
    emit(GetUserCartLoading());
    try{
      appCartList = await _getUserCartUsecase(const NoParameters());
      getCartItemsNumber();
      getTotalPrice();
      emit(GetUserCartSuccess());
    }catch(error){
      emit(GetUserCartError(error.toString()));
    }
  }

  int count = 1;
  void increaseCount(){
    count++;
    emit(IncreaseCountSuccess());
  }
  void decreaseCount(){
    if(count>1){
      count--;
      emit(DecreaseCountSuccess());
    }
  }
  void getCartItemsNumber(){
    for (var e in appCartList) {
      appCartItemsNumberCount =appCartItemsNumberCount+e.products!.length;
    }
  }

  void addToUserCartList(GetProductDetailsEntity getProductDetailsEntity){
    userCartList.add(getProductDetailsEntity);
    userCartTotalPrice=0;
    getUserCartListTotalPrice();
    emit(AddToUserCartSuccess());
  }
  void getTotalPrice(){
     for (var e in appCartList) {
       for (var e in e.products!) {
         appCartTotalPrice += e.price!*e.quantity!;
       }
     }
  }
  void getUserCartListTotalPrice(){
     for (var e in userCartList) {
       userCartTotalPrice+=(e.price!.toInt()*e.count!);
     }
  }

  void deleteItemFromAppCartList({required int cartProIndex, required int index}){
    appCartList[cartProIndex].products!.removeAt(index);
    if(appCartList[cartProIndex].products!.isEmpty){
      appCartList.removeAt(cartProIndex);
    }
    appCartItemsNumberCount=0;
    appCartTotalPrice=0;
    getCartItemsNumber();
    getTotalPrice();
    emit(ItemRemovedSuccessState());
  }

  void deleteFromUserCartList({required int index}){
    userCartList.removeAt(index);
    userCartItemsNumberCount=0;
    userCartTotalPrice=0;
    getUserCartListTotalPrice();
    emit(ItemRemovedSuccessState());
  }

  void checkOutCart()async{
    emit(CheckOutCartLoading());
    try{
      addToCartEntity = await _addToCartUsecase(userCartList.map((e) => AddToCartParameters(productId: e.id!, productCount: e.count!)).toList());
      emit(CheckOutCartSuccess());
    }catch(error){
      emit(CheckOutCartError(error.toString()));
    }
  }
}
