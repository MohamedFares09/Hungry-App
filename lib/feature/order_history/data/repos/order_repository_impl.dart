import 'package:dartz/dartz.dart';
import 'package:hungry_app/core/networking/errors/exception.dart';
import 'package:hungry_app/core/networking/errors/faliuer.dart';
import 'package:hungry_app/feature/order_history/data/datasources/order_remote_data_source.dart';
import 'package:hungry_app/feature/order_history/data/models/create_order_request.dart';
import 'package:hungry_app/feature/order_history/domain/repos/order_repo.dart';

import 'package:hungry_app/feature/order_history/domain/entities/order_entity.dart';

class OrderRepositoryImpl implements OrderRepo {
  final OrderRemoteDataSource remoteDataSource;

  OrderRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Faliuer, void>> createOrder(CreateOrderRequest request) async {
    try {
      await remoteDataSource.createOrder(request);
      return const Right(null);
    } on ServerException catch (e) {
      return Left(Faliuer(message: e.errorModel.message ?? "Unknown Error"));
    }
  }

  @override
  Future<Either<Faliuer, List<OrderEntity>>> getOrders() async {
    try {
      final orders = await remoteDataSource.getOrders();
      return Right(orders);
    } on ServerException catch (e) {
      return Left(Faliuer(message: e.errorModel.message ?? "Unknown Error"));
    }
  }
}
