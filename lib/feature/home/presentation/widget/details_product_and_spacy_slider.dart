import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hungry_app/core/constants/app_colors.dart';
import 'package:hungry_app/feature/home/presentation/cubit/product_details_cubit.dart';
import 'package:hungry_app/feature/home/presentation/cubit/product_details_state.dart';

class DetailsProductAndSpacySlider extends StatelessWidget {
  const DetailsProductAndSpacySlider({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
        builder: (context, state) {
          final spicyLevel = state is ProductDetailsSuccess
              ? state.spicyLevel
              : 0.0;
          final quantity = state is ProductDetailsSuccess ? state.quantity : 1;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 100),
              RichText(
                text: TextSpan(
                  text: 'Customize ',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    height: 1.4,
                  ),
                  children: const [
                    TextSpan(
                      text: 'Your Burger to Your Tastes. Ultimate Experience',
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 18),
              Text(
                'Spicy',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Slider(
                thumbColor: AppColors.primaryColor,
                activeColor: AppColors.primaryColor,
                padding: EdgeInsets.zero,
                min: 0,
                max: 1,
                value: spicyLevel,
                onChanged: (v) {
                  context.read<ProductDetailsCubit>().updateSpicyLevel(v);
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text('🥶'), Text('🥵')],
              ),
              SizedBox(height: 16),
              Text(
                'Quantity',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      if (quantity > 1) {
                        context.read<ProductDetailsCubit>().updateQuantity(
                          quantity - 1,
                        );
                      }
                    },
                    icon: Icon(Icons.remove_circle_outline),
                    color: AppColors.primaryColor,
                  ),
                  Text(
                    '$quantity',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                    onPressed: () {
                      context.read<ProductDetailsCubit>().updateQuantity(
                        quantity + 1,
                      );
                    },
                    icon: Icon(Icons.add_circle_outline),
                    color: AppColors.primaryColor,
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
