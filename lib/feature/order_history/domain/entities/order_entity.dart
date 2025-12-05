class OrderEntity {
  final int id;
  final double total;
  final String status;
  final String createdAt;
  final String productImage;

  const OrderEntity({
    required this.id,
    required this.total,
    required this.status,
    required this.createdAt,
    required this.productImage,
  });
}
