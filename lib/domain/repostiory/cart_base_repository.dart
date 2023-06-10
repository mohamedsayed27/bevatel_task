import 'package:untitled/domain/entities/add_to_cart_entity.dart';

import '../entities/get_user_cart_entity.dart';
import '../usecases/cart_usecases/add_to_cart_usecase.dart';

abstract class CartBaseRepository{
  Future<List<GetUserCartEntity>> getUserCart();
  Future<AddToCartEntity> addToCart(List<AddToCartParameters> addToCartParameters);
}