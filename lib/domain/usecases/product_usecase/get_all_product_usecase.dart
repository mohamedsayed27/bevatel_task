import '../../../core/base_usecases/base_usecase.dart';
import '../../entities/product_entity.dart';
import '../../repostiory/product_base_repository.dart';

class GetAllProductUsecase extends BaseUsecase<List<GetAllProductsEntity>,NoParameters>{
  final ProductBaseRepository productBaseRepository;

  GetAllProductUsecase({required this.productBaseRepository});
  @override
  Future<List<GetAllProductsEntity>> call(NoParameters parameters) async{
    return await productBaseRepository.getAllProductsList();
  }

}