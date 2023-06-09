import 'package:untitled/domain/entities/get_user_cart_entity.dart';
import 'package:untitled/domain/repostiory/cart_base_repository.dart';

import '../data_source/cart_remote_data_source.dart';

class CartRepository extends CartBaseRepository{
  final CartRemoteBaseDataSource cartRemoteBaseDataSource;

  CartRepository(this.cartRemoteBaseDataSource);
  @override
  Future<List<GetUserCartEntity>> getUserCart() async{
    try{
      return await cartRemoteBaseDataSource.getUserCart();
    }catch(error){
      print(error);
      rethrow;
    }
  }

}