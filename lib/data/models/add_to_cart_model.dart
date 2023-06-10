import '../../domain/entities/add_to_cart_entity.dart';

class AddToCartModel extends AddToCartEntity {
  const AddToCartModel({
    required super.id,
    required super.userId,
    required super.date,
    required super.products,
  });

  factory AddToCartModel.fromJson(Map<String, dynamic> json) {
    return AddToCartModel(
      id: json['id'],
      userId: json['userId'],
      date: json['date'],
      products: json["products"].length == 0
          ? null
          : List<AddToCartProductsMode>.from(json["products"].map(
              (element) => AddToCartProductsMode.fromJson(element))),
    );
  }
}

class AddToCartProductsMode extends AddToCartProductsEntity {
  const AddToCartProductsMode({
    required super.productId,
    required super.quantity,
  });

  factory AddToCartProductsMode.fromJson(Map<String, dynamic> json) {
    return AddToCartProductsMode(
      productId: json['productId'],
      quantity: json['quantity'],
    );
  }
}
