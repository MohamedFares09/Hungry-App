import 'package:dartz/dartz.dart';
import 'package:hungry_app/core/networking/errors/faliuer.dart';
import 'package:hungry_app/feature/order_history/domain/entities/order_entity.dart';
import 'package:hungry_app/feature/order_history/domain/repos/order_repo.dart';

class GetOrdersUseCase {
  final OrderRepo orderRepo;

  GetOrdersUseCase({required this.orderRepo});

  Future<Either<Faliuer, List<OrderEntity>>> call() async {
    return await orderRepo.getOrders();
  }
}
