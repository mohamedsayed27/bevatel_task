
abstract class CartState {}

class CartInitial extends CartState {}
class GetUserCartLoading extends CartState {}
class GetUserCartSuccess extends CartState {}
class GetUserCartError extends CartState {
  final String error;

  GetUserCartError(this.error);
}
class AddToCartCartLoading extends CartState {}
class AddToCartCartSuccess extends CartState {}
class AddToCartCartError extends CartState {
  final String error;

  AddToCartCartError(this.error);
}
class ItemRemovedSuccessState extends CartState {}
class IncreaseCountSuccess extends CartState {}
class DecreaseCountSuccess extends CartState {}
