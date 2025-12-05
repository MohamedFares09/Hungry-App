import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hungry_app/core/constants/app_colors.dart';
import 'package:hungry_app/core/widgets/custom_button.dart';
import 'package:hungry_app/feature/cart/presentation/cubit/cart_cubit.dart';
import 'package:hungry_app/feature/cart/presentation/cubit/cart_state.dart';

class PriceSection extends StatelessWidget {
  const PriceSection({
    super.key,
    this.nameButton,
    required this.price,
    this.onTap,
    this.showLoadingFromCart = false,
  });
  final String? nameButton;
  final String price;
  final Function()? onTap;
  final bool showLoadingFromCart;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Total',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 5),
              Text(
                '\$ $price',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.w400),
              ),
            ],
          ),
          Spacer(),
          showLoadingFromCart
              ? BlocBuilder<CartCubit, CartState>(
                  builder: (context, state) {
                    final isLoading = state is CartLoading;
                    return _buildButton(isLoading);
                  },
                )
              : _buildButton(false),
        ],
      ),
    );
  }

  Widget _buildButton(bool isLoading) {
    return CustomButton(
      onTap: isLoading ? null : onTap,
      height: 50,
      padding: EdgeInsetsGeometry.symmetric(horizontal: 40, vertical: 2),
      text: nameButton ?? 'Add To Card',
      color: Colors.white,
      backGroundColor: isLoading
          ? AppColors.primaryColor.withOpacity(0.6)
          : AppColors.primaryColor,
      child: isLoading
          ? SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
            )
          : null,
    );
  }
}
