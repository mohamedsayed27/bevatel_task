
abstract class CartState {}

class CartInitial extends CartState {}
class GetUserCartLoading extends CartState {}
class GetUserCartSuccess extends CartState {}
class GetUserCartError extends CartState {
  final String error;

  GetUserCartError(this.error);
}
