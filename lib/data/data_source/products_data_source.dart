import 'package:untitled/core/network/api_end_points.dart';
import 'package:untitled/core/network/dio_helper.dart';
import 'package:untitled/data/models/get_all_products_model.dart';
import 'package:untitled/data/models/product_details_model.dart';

abstract class ProductsBaseRemoteDataSource{
  Future<List<GetAllProductsModel>> getAllProductsList();
  Future<ProductDetailsModel> getProductDetails(int id);
}

class ProductsRemoteDataSource extends ProductsBaseRemoteDataSource{
  final DioHelper dioHelper;

  ProductsRemoteDataSource({required this.dioHelper});
  @override
  Future<List<GetAllProductsModel>> getAllProductsList() async{
    final response =  await dioHelper.getData(url: EndPoints.allProducts);
    print(response);
    return List<GetAllProductsModel>.from(response.data.map((e) => GetAllProductsModel.fromJson(e))).toList();
  }

  @override
  Future<ProductDetailsModel> getProductDetails(int id) async{
    final response =  await dioHelper.getData(url: "${EndPoints.productDetailsById}$id");
    print(response);
    return ProductDetailsModel.fromJson(response.data);
  }

}