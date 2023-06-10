import 'package:equatable/equatable.dart';

class AddToCartEntity extends Equatable{
  final int? id;
  final int? userId;
  final String? date;
  final List<AddToCartProductsEntity>? products;

  const AddToCartEntity({required this.id, required this.userId, required this.date, required this.products, });

  @override
  // TODO: implement props
  List<Object?> get props => [
  id, userId, date, products
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
class AddToCartProductsEntity extends Equatable {
  final int? productId;
  final int? quantity;

  const AddToCartProductsEntity({required this.productId, required this.quantity,});

  @override
  // TODO: implement props
  List<Object?> get props => [productId, quantity,];

// factory Products.fromJson(Map<String, dynamic> json) {
//   return Products(productId: json['productId'],
//     quantity: json['quantity'],)
// }


}