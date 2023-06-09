
abstract class ProductState {}

class ProductInitial extends ProductState {}
class GetAllProductsLoading extends ProductState {}
class GetAllProductsSucess extends ProductState {}
class GetAllProductsError extends ProductState {
  final String error;

  GetAllProductsError(this.error);
}
class GetProductDetailsLoading extends ProductState {}
class GetProductDetailsSucess extends ProductState {}
class GetProductDetailsError extends ProductState {
  final String error;

  GetProductDetailsError(this.error);
}
