import 'package:flutter/material.dart';
import 'package:hungry_app/feature/home/presentation/widget/card_item.dart';
import 'package:hungry_app/feature/home/presentation/widget/category_list.dart';
import 'package:hungry_app/feature/home/presentation/widget/sliver_appbar_home_view.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBarHomeView(),
        SliverToBoxAdapter(
          child: Column(
            children: [
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: const CategoryList(),
              ),
            ],
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          sliver: SliverGrid(
            delegate: SliverChildBuilderDelegate(childCount: 6, (
              context,
              index,
            ) {
              return const CardItem(
                title: 'Cheeseburger',
                desc: 'Wendy’s Burger',
                image: 'assets/images/image_test.png',
                rate: '4.9',
              );
            }),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.83,
            ),
          ),
        ),
      ],
    );
  }
}
