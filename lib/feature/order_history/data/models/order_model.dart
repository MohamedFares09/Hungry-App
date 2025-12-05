import 'package:hungry_app/feature/order_history/domain/entities/order_entity.dart';

class OrderModel extends OrderEntity {
  const OrderModel({
    required super.id,
    required super.total,
    required super.status,
    required super.createdAt,
    required super.productImage,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      id: json['id'] as int,
      total: double.tryParse(json['total_price'].toString()) ?? 0.0,
      status: json['status'] as String? ?? 'pending',
      createdAt: json['created_at'] as String? ?? '',
      productImage: json['product_image'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'total_price': total.toStringAsFixed(2),
      'status': status,
      'created_at': createdAt,
      'product_image': productImage,
    };
  }
}
