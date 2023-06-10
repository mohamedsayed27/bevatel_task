import 'package:untitled/data/models/get_cart_model.dart';

import '../../core/network/api_end_points.dart';
import '../../core/network/dio_helper.dart';
import '../../domain/usecases/cart_usecases/add_to_cart_usecase.dart';
import '../models/add_to_cart_model.dart';

abstract class CartRemoteBaseDataSource{
Future<List<GetUserCartModel>> getUserCart();
Future<AddToCartModel> addToCart(List<AddToCartParameters> addToCartParameters);
}

class CartRemoteDataSource extends CartRemoteBaseDataSource{
  final DioHelper dioHelper;

  CartRemoteDataSource({required this.dioHelper});
  @override
  Future<List<GetUserCartModel>> getUserCart() async{
    final response =  await dioHelper.getData(url: EndPoints.getUserCart);
    return List<GetUserCartModel>.from(response.data.map((e) => GetUserCartModel.fromJson(e,150))).toList();
  }

  @override
  Future<AddToCartModel> addToCart(List<AddToCartParameters> addToCartParameters)async{
    final response =  await dioHelper.postData(url: EndPoints.addToCart,data: {
      "userId":1,
      "date":DateTime.now().toIso8601String(),
      "products":addToCartParameters.map((e) => e.toJson()).toList(),
    });
    return AddToCartModel.fromJson(response.data);
  }
}