import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hungry_app/feature/home/presentation/cubit/product_cubit.dart';
import 'package:hungry_app/feature/home/presentation/cubit/product_state.dart';
import 'package:hungry_app/feature/home/presentation/widget/card_item.dart';
import 'package:hungry_app/feature/home/presentation/widget/category_list.dart';
import 'package:hungry_app/feature/home/presentation/widget/sliver_appbar_home_view.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
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
            // Handle different states
            if (state is ProductLoading)
              SliverToBoxAdapter(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(50.0),
                    child: CircularProgressIndicator(),
                  ),
                ),
              )
            else if (state is ProductError)
              SliverToBoxAdapter(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(50.0),
                    child: Text(
                      state.message,
                      style: TextStyle(color: Colors.red, fontSize: 16),
                    ),
                  ),
                ),
              )
            else if (state is ProductSuccess)
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                sliver: SliverGrid(
                  delegate: SliverChildBuilderDelegate((context, index) {
                    return CardItem(
                      title: state.products[index].title,
                      desc: state.products[index].desc,
                      image: state.products[index].image,
                      rate: state.products[index].rate,
                    );
                  }, childCount: state.products.length),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.83,
                  ),
                ),
              )
            else
              SliverToBoxAdapter(child: SizedBox.shrink()),
          ],
        );
      },
    );
  }
}
