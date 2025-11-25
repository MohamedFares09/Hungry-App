
import 'package:flutter/material.dart';
import 'package:hungry_app/core/constants/app_colors.dart';

class DetailsProductAndSpacySlider extends StatefulWidget {
  const DetailsProductAndSpacySlider({super.key});

  @override
  State<DetailsProductAndSpacySlider> createState() => _DetailsAndSpacySliderState();
}

class _DetailsAndSpacySliderState extends State<DetailsProductAndSpacySlider> {
  double currentSlider = 0;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
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
            value: currentSlider,
            onChanged: (v) {
              setState(() {
                currentSlider = v;
              });
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text('🥶'), Text('🥵')],
          ),
        ],
      ),
    );
  }
}
