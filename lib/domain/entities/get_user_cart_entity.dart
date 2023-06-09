import 'package:equatable/equatable.dart';

class GetUserCartEntity extends Equatable{
  final int? id;
  final int? userId;
  final String? date;
  final List<UserCartProductsEntity>? products;
  final int? iV;

  const GetUserCartEntity({required this.id, required this.userId, required this.date, required this.products, required this.iV});

  @override
  // TODO: implement props
  List<Object?> get props => [
    id, userId, date, products, iV
  ];

  // GetUserCartEntity.fromJson(Map<String, dynamic> json) {
  //   id = json['id'];
  //   userId = json['userId'];
  //   date = json['date'];
  //   if (json['products'] != null) {
  //     products = <Products>[];
  //     json['products'].forEach((v) {
  //       products!.add(new Products.fromJson(v));
  //     });
  //   }
  //   iV = json['__v'];
  // }

}

class UserCartProductsEntity extends Equatable {
  final int? productId;
  final int? quantity;

  const UserCartProductsEntity({required this.productId, required this.quantity});

  @override
  // TODO: implement props
  List<Object?> get props => [productId, quantity,];

  // factory Products.fromJson(Map<String, dynamic> json) {
  //   return Products(productId: json['productId'],
  //     quantity: json['quantity'],)
  // }


}
