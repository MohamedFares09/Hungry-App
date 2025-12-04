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
      price: json['price']?.toString() ?? '0',
      title: json['name'] ?? '',
      desc: json['description'] ?? '',
      image: _getFullImageUrl(json['image'] ?? ''),
      rate: json['rating']?.toString() ?? '0.0',
    );
  }

  static String _getFullImageUrl(String imageUrl) {
    if (imageUrl.isEmpty) return '';
    if (imageUrl.startsWith('http://') || imageUrl.startsWith('https://')) {
      return imageUrl;
    }
    // إضافة base URL إذا كان المسار نسبي
    const baseUrl = 'https://sonic-zdi0.onrender.com';
    return imageUrl.startsWith('/')
        ? '$baseUrl$imageUrl'
        : '$baseUrl/$imageUrl';
  }
}
