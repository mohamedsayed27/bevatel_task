import '../entities/get_user_cart_entity.dart';

abstract class CartBaseRepository{
  Future<List<GetUserCartEntity>> getUserCart();
}