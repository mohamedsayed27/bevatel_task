
abstract class CartState {}

class CartInitial extends CartState {}
class GetUserCartLoading extends CartState {}
class GetUserCartSuccess extends CartState {}
class GetUserCartError extends CartState {
  final String error;

  GetUserCartError(this.error);
}
class CheckOutCartLoading extends CartState {}
class CheckOutCartSuccess extends CartState {}
class CheckOutCartError extends CartState {
  final String error;

  CheckOutCartError(this.error);
}
class ItemRemovedSuccessState extends CartState {}
class IncreaseCountSuccess extends CartState {}
class DecreaseCountSuccess extends CartState {}
class AddToUserCartSuccess extends CartState {}
