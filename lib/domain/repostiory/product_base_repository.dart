import '../entities/product_details_entity.dart';
import '../entities/product_entity.dart';

abstract class ProductBaseRepository{
  Future<List<GetAllProductsEntity>> getAllProductsList();
  Future<GetProductDetailsEntity> getProductDetails(int id);
}
