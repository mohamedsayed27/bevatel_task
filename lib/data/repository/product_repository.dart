import 'package:untitled/data/data_source/products_data_source.dart';
import 'package:untitled/domain/entities/product_details_entity.dart';

import 'package:untitled/domain/entities/product_entity.dart';

import '../../domain/repostiory/product_base_repository.dart';

class ProductRepository extends ProductBaseRepository{
  final ProductsBaseRemoteDataSource productsRemoteDataSource;

  ProductRepository({required this.productsRemoteDataSource});
  @override
  Future<List<GetAllProductsEntity>> getAllProductsList() async{
    try{
      return await productsRemoteDataSource.getAllProductsList();
    }catch(error){
      rethrow;
    }
  }

  @override
  Future<GetProductDetailsEntity> getProductDetails(int id) async{
    try{
      return await productsRemoteDataSource.getProductDetails(id);
    }catch(error){
      rethrow;
    }
  }

}