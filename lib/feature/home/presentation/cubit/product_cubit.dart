import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hungry_app/feature/home/doman/usecases/home_usecases.dart';
import 'package:hungry_app/feature/home/presentation/cubit/product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  final HomeUsecases homeUsecases;
  ProductCubit(this.homeUsecases) : super(ProductInitial());

  void getProducts() async {
    if (isClosed) return;
    emit(ProductLoading());

    final result = await homeUsecases.getProducts();

    if (isClosed) return;

    result.fold(
      (failure) {
        if (!isClosed) {
          emit(ProductError(message: failure.message));
        }
      },
      (products) {
        if (!isClosed) {
          emit(ProductSuccess(products: products));
        }
      },
    );
  }
}
