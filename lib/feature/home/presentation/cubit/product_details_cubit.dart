import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hungry_app/feature/home/data/data_sources/home_remote_data_sources.dart';
import 'package:hungry_app/feature/home/data/model/topping_model.dart';
import 'package:hungry_app/feature/home/doman/usecases/product_with_id_use_cases.dart';
import 'package:hungry_app/feature/home/presentation/cubit/product_details_state.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsState> {
  final ProductWithIdUseCases productWithIdUseCases;
  final HomeRemoteDataSource homeRemoteDataSource;

  ProductDetailsCubit(this.productWithIdUseCases, this.homeRemoteDataSource)
    : super(ProductDetailsInitial());

  void getProductDetails(int productId) async {
    if (isClosed) return;
    emit(ProductDetailsLoading());

    try {
      // Fetch product details
      final productResult = await productWithIdUseCases.getProductWithId(
        productId,
      );

      // Fetch toppings and side options in parallel
      final toppingsAndOptions = await Future.wait([
        homeRemoteDataSource.getToppings(),
        homeRemoteDataSource.getSideOptions(),
      ]);

      if (isClosed) return;

      final List<ToppingModel> toppings = toppingsAndOptions[0];
      final List<ToppingModel> sideOptions = toppingsAndOptions[1];

      productResult.fold(
        (failure) {
          if (!isClosed) {
            emit(ProductDetailsError(message: failure.message));
          }
        },
        (product) {
          if (!isClosed) {
            emit(
              ProductDetailsSuccess(
                product: product,
                toppings: toppings,
                sideOptions: sideOptions,
              ),
            );
          }
        },
      );
    } catch (e) {
      if (!isClosed) {
        emit(ProductDetailsError(message: e.toString()));
      }
    }
  }

  void toggleTopping(int toppingId) {
    if (state is ProductDetailsSuccess) {
      final currentState = state as ProductDetailsSuccess;
      final selectedToppings = List<int>.from(currentState.selectedToppings);

      if (selectedToppings.contains(toppingId)) {
        selectedToppings.remove(toppingId);
      } else {
        selectedToppings.add(toppingId);
      }

      emit(currentState.copyWith(selectedToppings: selectedToppings));
    }
  }

  void toggleSideOption(int sideOptionId) {
    if (state is ProductDetailsSuccess) {
      final currentState = state as ProductDetailsSuccess;
      final selectedSideOptions = List<int>.from(
        currentState.selectedSideOptions,
      );

      if (selectedSideOptions.contains(sideOptionId)) {
        selectedSideOptions.remove(sideOptionId);
      } else {
        selectedSideOptions.add(sideOptionId);
      }

      emit(currentState.copyWith(selectedSideOptions: selectedSideOptions));
    }
  }

  void updateSpicyLevel(double level) {
    if (state is ProductDetailsSuccess) {
      final currentState = state as ProductDetailsSuccess;
      emit(currentState.copyWith(spicyLevel: level));
    }
  }

  void updateQuantity(int newQuantity) {
    if (state is ProductDetailsSuccess && newQuantity > 0) {
      final currentState = state as ProductDetailsSuccess;
      emit(currentState.copyWith(quantity: newQuantity));
    }
  }
}
