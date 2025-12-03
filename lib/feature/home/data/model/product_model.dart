import 'package:dartz/dartz.dart';
import 'package:hungry_app/feature/home/doman/entities/home_entity.dart';

class ProductModel extends HomeEntity {
  ProductModel({
    required super.id,
    required super.title,
    required super.desc,
    required super.image,
    required super.rate,
    required super.price,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'] ?? 0,
      price: json['price'] ?? 0,
      title: json['name'] ?? '',
      desc: json['description'] ?? '',
      image: json['image'] ?? '',
      rate: cast(json['rating']) ?? '0.0',
    );
  }
}
