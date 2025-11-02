import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hungry_app/core/constants/app_image.dart';

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 300),
        Center(child: SvgPicture.asset(Assets.svgTextSplashImage)),
        Spacer(),
        Image.asset(Assets.pngSplashImage),
      ],
    );
  }
}
