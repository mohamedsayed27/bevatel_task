import 'package:untitled/data/models/get_cart_model.dart';

import '../../core/network/api_end_points.dart';
import '../../core/network/dio_helper.dart';

abstract class CartRemoteBaseDataSource{
Future<List<GetUserCartModel>> getUserCart();
}

class CartRemoteDataSource extends CartRemoteBaseDataSource{
  final DioHelper dioHelper;

  CartRemoteDataSource({required this.dioHelper});
  @override
  Future<List<GetUserCartModel>> getUserCart() async{
    final response =  await dioHelper.getData(url: EndPoints.getUserCart);
    print(List<GetUserCartModel>.from(response.data.map((e) => GetUserCartModel.fromJson(e))).toList());
    return List<GetUserCartModel>.from(response.data.map((e) => GetUserCartModel.fromJson(e))).toList();
  }

}