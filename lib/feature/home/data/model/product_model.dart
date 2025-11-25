import 'package:dartz/dartz.dart';
import 'package:hungry_app/feature/home/doman/entities/home_entity.dart';

class ProductModel extends HomeEntity {
  final int id;
  final String price;

  ProductModel({
    required super.title,
    required super.desc,
    required super.image,
    required super.rate,
    required this.id,
    required this.price,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'] ?? 0,
      price: json['price']?.toString() ?? '0',
      title: json['name'] ?? '',
      desc: json['description'] ?? '',
      image: json['image'] ?? '',
      rate: cast(json['rating']) ?? '0.0',
    );
  }
}
