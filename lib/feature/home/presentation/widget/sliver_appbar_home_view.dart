
import 'package:flutter/material.dart';
import 'package:hungry_app/core/constants/app_styles.dart';
import 'package:hungry_app/feature/home/presentation/widget/header_home_view.dart';
import 'package:hungry_app/feature/home/presentation/widget/search_text_filed.dart';

class SliverAppBarHomeView extends StatelessWidget {
  const SliverAppBarHomeView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.white,
      toolbarHeight: 210,
      scrolledUnderElevation: 0,
      floating: false,
      pinned: true,
      elevation: 0,
      flexibleSpace: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            const SizedBox(height: 70),
            const HeaderHomeView(),
            Align(
              alignment: Alignment.topLeft,
              child: Text('Hello Rich Sonic', style: AppStyles.mediam18),
            ),
            const SizedBox(height: 18),
            const SearchTextFiled(),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
