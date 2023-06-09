import 'package:untitled/domain/entities/product_details_entity.dart';

class ProductDetailsModel extends GetProductDetailsEntity {
  const ProductDetailsModel({
    required super.id,
    required super.title,
    required super.price,
    required super.category,
    required super.description,
    required super.image,
  });

  factory ProductDetailsModel.fromJson(Map<String, dynamic> json) {
    return ProductDetailsModel(
      id: json['id'],
      title: json['title'],
      price: double.parse(json['price'].toString()),
      category: json['category'],
      description: json['description'],
      image: json['image'],
    );
  }
}
