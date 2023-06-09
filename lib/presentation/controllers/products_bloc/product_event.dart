
abstract class ProductEvent {}
class GetAllProductEvent extends ProductEvent{}
class GetProductDetailsEvent extends ProductEvent{
  final int id;

  GetProductDetailsEvent({required this.id});
}
