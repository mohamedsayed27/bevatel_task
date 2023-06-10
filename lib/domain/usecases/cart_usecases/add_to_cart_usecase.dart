import 'package:equatable/equatable.dart';
import 'package:untitled/domain/entities/add_to_cart_entity.dart';

import '../../../core/base_usecases/base_usecase.dart';
import '../../repostiory/cart_base_repository.dart';

class AddToCartUsecase extends BaseUsecase<AddToCartEntity, AddToCartParameters> {
  final CartBaseRepository cartBaseRepository;

  AddToCartUsecase({required this.cartBaseRepository});
  @override
  Future<AddToCartEntity> call(AddToCartParameters parameters) async{
    return await cartBaseRepository.addToCart(parameters);
  }
}

class AddToCartParameters extends Equatable {
  final int productId;
  final int productCount;

  const AddToCartParameters({
    required this.productId,
    required this.productCount,
  });

  Map<String, dynamic> toJson() => {
    "productId":productId,
    "quantity":productCount,
  };
  @override
  // TODO: implement props
  List<Object?> get props => [
        productId,
        productCount,
      ];
}
