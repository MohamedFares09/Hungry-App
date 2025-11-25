import 'package:hungry_app/feature/home/doman/entities/home_entity.dart';

class ProductState {}

class ProductInitial extends ProductState {}

class ProductLoading extends ProductState {}

class ProductSuccess extends ProductState {
  final List<HomeEntity> products;
  ProductSuccess({required this.products});
}

class ProductError extends ProductState {
  final String message;
  ProductError({required this.message});
}
