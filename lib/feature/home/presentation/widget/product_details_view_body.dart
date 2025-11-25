import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hungry_app/feature/home/presentation/cubit/product_details_cubit.dart';
import 'package:hungry_app/feature/home/presentation/cubit/product_details_state.dart';
import 'package:hungry_app/feature/home/presentation/widget/details_product_and_spacy_slider.dart';
import 'package:hungry_app/feature/home/presentation/widget/topping_item.dart';

class ProductDetailsViewBody extends StatelessWidget {
  const ProductDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
      builder: (context, state) {
        if (state is ProductDetailsLoading) {
          return Center(child: CircularProgressIndicator());
        }

        if (state is ProductDetailsError) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.error_outline, size: 60, color: Colors.red),
                SizedBox(height: 16),
                Text(
                  state.message,
                  style: TextStyle(fontSize: 16, color: Colors.red),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          );
        }

        if (state is ProductDetailsSuccess) {
          final product = state.product;

          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Product Image and Details Section
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Product Image
                    Container(
                      width: 200,
                      height: 250,
                      child: CachedNetworkImage(
                        imageUrl: product.image,
                        fit: BoxFit.contain,
                        placeholder: (context, url) => Container(
                          color: Colors.grey[200],
                          child: Center(child: CircularProgressIndicator()),
                        ),
                        errorWidget: (context, url, error) => Container(
                          color: Colors.grey[200],
                          child: Icon(Icons.error, size: 50),
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    // Details and Spicy Slider
                    DetailsProductAndSpacySlider(),
                    SizedBox(width: 8),
                  ],
                ),
                SizedBox(height: 30),

                // Product Title
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  child: Text(
                    product.title,
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 12),

                // Product Description
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  child: Text(
                    product.desc,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[700],
                      height: 1.5,
                    ),
                  ),
                ),
                SizedBox(height: 30),

                // Toppings Section
                Padding(
                  padding: const EdgeInsets.only(left: 18),
                  child: Text(
                    'Toppings',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                ),
                SizedBox(height: 8),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: state.toppings.map((topping) {
                      return ToppingItem(
                        name: topping.name,
                        image: topping.image,
                      );
                    }).toList(),
                  ),
                ),
                SizedBox(height: 30),

                // Side Options Section
                Padding(
                  padding: const EdgeInsets.only(left: 18),
                  child: Text(
                    'Side options',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                ),
                SizedBox(height: 8),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: state.sideOptions.map((option) {
                      return ToppingItem(
                        name: option.name,
                        image: option.image,
                      );
                    }).toList(),
                  ),
                ),
                SizedBox(height: 150), // Space for bottom sheet
              ],
            ),
          );
        }

        return SizedBox.shrink();
      },
    );
  }
}
