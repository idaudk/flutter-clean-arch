// 1st step
import 'package:equatable/equatable.dart';

class ProductEntity extends Equatable {
  int? id;
  String? title;
  String? description;
  int? price;
  double? discountPercentage;
  double? rating;
  int? stock;
  String? brand;
  String? category;
  String? thumbnail;
  List<String>? images;

  ProductEntity({
    this.id,
    this.title,
    this.description,
    this.price,
    this.discountPercentage,
    this.rating,
    this.stock,
    this.brand,
    this.category,
    this.thumbnail,
    this.images,
  });

  @override
  List<Object?> get props => [
        id,
        title,
        description,
        discountPercentage,
        rating,
        price,
        stock,
        brand,
        category,
        thumbnail,
        images,
      ];
}
