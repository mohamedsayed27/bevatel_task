import 'package:equatable/equatable.dart';

class GetAllProductsEntity extends Equatable {
  final int? id;
  final String? title;
  final double? price;
  final String? description;
  final String? category;
  final String? image;
  final RatingEntity? rating;

  const GetAllProductsEntity({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rating,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        title,
        price,
        description,
        category,
        image,
        rating,
      ];

// GetAllProductsEntity.fromJson(Map<String, dynamic> json) {
//   id = json['id'];
//   title = json['title'];
//   price = json['price'];
//   description = json['description'];
//   category = json['category'];
//   image = json['image'];
//   rating =
//   json['rating'] != null ? new Rating.fromJson(json['rating']) : null;
// }
}

class RatingEntity extends Equatable {
  final double? rate;
  final double? count;

  const RatingEntity({
    required this.rate,
    required this.count,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        rate,
        count,
      ];

// Rating.fromJson(Map<String, dynamic> json) {
//   rate = json['rate'];
//   count = json['count'];
// }
}
