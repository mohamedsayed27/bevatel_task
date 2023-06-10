import 'package:untitled/domain/entities/get_user_cart_entity.dart';

class GetUserCartModel extends GetUserCartEntity {
  const GetUserCartModel({
    required super.id,
    required super.userId,
    required super.date,
    required super.products,
    required super.iV,
  });

  factory GetUserCartModel.fromJson(Map<String, dynamic> json,int price) {
    return GetUserCartModel(
      id: json['id'],
      userId: json['userId'],
      date: json['date'],
      iV: json['__v'],
      products: json["products"].length == 0
          ? null
          : List<UserCartProductsMode>.from(json["products"]
              .map((element) => UserCartProductsMode.fromJson(element,price))),
    );
  }
}

class UserCartProductsMode extends UserCartProductsEntity {
  const UserCartProductsMode(
      {required super.productId, required super.quantity,required super.price, });

  factory UserCartProductsMode.fromJson(Map<String, dynamic> json,int price) {
    return UserCartProductsMode(
      productId: json['productId'],
      quantity: json['quantity'], price: price,
    );
  }
}
