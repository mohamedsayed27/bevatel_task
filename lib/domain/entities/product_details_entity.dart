import 'package:equatable/equatable.dart';

class GetProductDetailsEntity extends Equatable {
  final int? id;
  final String? title;
  final double? price;
  final String? category;
  final String? description;
  final String? image;

  const GetProductDetailsEntity({
    required this.id,
    required this.title,
    required this.price,
    required this.category,
    required this.description,
    required this.image,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [id, title, price, category, description, image];


}
