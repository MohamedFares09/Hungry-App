import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hungry_app/core/constants/app_colors.dart';
import 'package:hungry_app/core/constants/app_image.dart';

class HeaderHomeView extends StatelessWidget {
  const HeaderHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          Assets.svgTextSplashImage,
          // ignore: deprecated_member_use
          color: AppColors.primaryColor,
        ),
        Spacer(),
        CircleAvatar(
          radius: 30,
          child: Image.asset(
            'assets/images/sonic_image.png',
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }
}
