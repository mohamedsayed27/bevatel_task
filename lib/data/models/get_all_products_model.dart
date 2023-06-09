import 'package:untitled/domain/entities/product_entity.dart';

class GetAllProductsModel extends GetAllProductsEntity {
  const GetAllProductsModel({
    required super.id,
    required super.title,
    required super.price,
    required super.description,
    required super.category,
    required super.image,
    required super.rating,
  });

  factory GetAllProductsModel.fromJson(Map<String, dynamic> json) {
    return GetAllProductsModel(
      id: json['id'],
      title: json['title'],
      price: double.parse(json['price'].toString()),
      description: json['description'],
      category: json['category'],
      image: json['image'],
      rating:
          json['rating'] != null ? RatingModel.fromJson(json['rating']) : null,
    );
  }
}

class RatingModel extends RatingEntity {
  const RatingModel({
    required super.rate,
    required super.count,
  });

  factory RatingModel.fromJson(Map<String, dynamic> json) {
    return RatingModel(
      rate: double.parse(json['rate'].toString()),
      count: double.parse(json['count'].toString()),
    );
  }
}
