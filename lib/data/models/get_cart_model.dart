import 'package:untitled/domain/entities/get_user_cart_entity.dart';

class GetUserCartModel extends GetUserCartEntity {
  const GetUserCartModel(
      {required super.id,
      required super.userId,
      required super.date,
      required super.products,
      required super.iV});

  factory GetUserCartModel.fromJson(Map<String, dynamic> json) {
    return GetUserCartModel(
      id: json['id'],
      userId: json['userId'],
      date: json['date'],
      iV: json['__v'],
      products: json["products"].length==0?null:List<UserCartProductsMode>.from(json["products"].map((element) => UserCartProductsMode.fromJson(element))),
    );
  }
}

class UserCartProductsMode extends UserCartProductsEntity {
  const UserCartProductsMode(
      {required super.productId, required super.quantity});

  factory UserCartProductsMode.fromJson(Map<String, dynamic> json) {
    return UserCartProductsMode(
      productId: json['productId'],
      quantity: json['quantity'],
    );
  }
}
