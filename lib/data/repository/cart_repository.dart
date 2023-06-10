import 'package:untitled/domain/entities/add_to_cart_entity.dart';
import 'package:untitled/domain/entities/get_user_cart_entity.dart';
import 'package:untitled/domain/repostiory/cart_base_repository.dart';

import '../../domain/usecases/cart_usecases/add_to_cart_usecase.dart';
import '../data_source/cart_remote_data_source.dart';

class CartRepository extends CartBaseRepository{
  final CartRemoteBaseDataSource cartRemoteBaseDataSource;

  CartRepository({required this.cartRemoteBaseDataSource});
  @override
  Future<List<GetUserCartEntity>> getUserCart() async{
    try{
      return await cartRemoteBaseDataSource.getUserCart();
    }catch(error){
      print(error);
      rethrow;
    }
  }

  @override
  Future<AddToCartEntity> addToCart(AddToCartParameters addToCartParameters) async{
    try{
      return await cartRemoteBaseDataSource.addToCart(addToCartParameters);
    }catch(error){
      print(error);
      rethrow;
    }
  }

}