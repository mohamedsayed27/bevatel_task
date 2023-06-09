import 'package:untitled/domain/entities/product_details_entity.dart';
import 'package:untitled/domain/repostiory/product_base_repository.dart';

import '../../../core/base_usecases/base_usecase.dart';

class GetProductDetailsUsecase extends BaseUsecase<GetProductDetailsEntity,int>{
  final ProductBaseRepository productBaseRepository;

  GetProductDetailsUsecase({required this.productBaseRepository});
  @override
  Future<GetProductDetailsEntity> call(int parameters) async{
    return await productBaseRepository.getProductDetails(parameters);
  }

}