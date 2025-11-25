import 'package:flutter/material.dart';
import 'package:hungry_app/feature/home/presentation/widget/details_product_and_spacy_slider.dart';
import 'package:hungry_app/feature/home/presentation/widget/topping_item.dart';

class ProductDetailsViewBody extends StatelessWidget {
  const ProductDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset('assets/images/product_details_view_image.png'),
              const SizedBox(width: 50),
              DetailsProductAndSpacySlider(),
              SizedBox(width: 8),
            ],
          ),
          SizedBox(height: 50),
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
              children: List.generate(4, (index) {
                return ToppingItem(
                  name: 'Tomato',
                  image: 'assets/images/Tomato.png',
                );
              }),
            ),
          ),
          SizedBox(height: 50),
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
              children: List.generate(4, (index) {
                return ToppingItem(
                  name: 'Potato',
                  image: 'assets/images/potato.png',
                );
              }),
            ),
          ),
          SizedBox(height: 50),
         
          SizedBox(height: 30),
        ],
      ),
    );
  }
}
