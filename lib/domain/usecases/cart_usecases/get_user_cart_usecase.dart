import 'package:untitled/domain/entities/get_user_cart_entity.dart';
import 'package:untitled/domain/repostiory/cart_base_repository.dart';

import '../../../core/base_usecases/base_usecase.dart';

class GetUserCartUsecase extends BaseUsecase<List<GetUserCartEntity>,NoParameters>{
  final CartBaseRepository cartBaseRepository;

  GetUserCartUsecase({required this.cartBaseRepository});
  @override
  Future<List<GetUserCartEntity>> call(NoParameters parameters) async{
    return await cartBaseRepository.getUserCart();
  }

}