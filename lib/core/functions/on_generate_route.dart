import 'package:flutter/material.dart';
import 'package:hungry_app/feature/auth/login/presentation/login_view.dart';
import 'package:hungry_app/feature/auth/register/presentation/register_view.dart';
import 'package:hungry_app/feature/cart/presentation/cart_view.dart';
import 'package:hungry_app/feature/check_out/presentation/view/checkout_view.dart';
import 'package:hungry_app/feature/home/presentation/home_view.dart';
import 'package:hungry_app/feature/home/presentation/product_datails_view.dart';
import 'package:hungry_app/feature/splash/presentation/splash_view.dart';
import 'package:hungry_app/root.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case SplashView.routeName:
      return MaterialPageRoute(builder: (context) => const SplashView());
    case LoginView.routeName:
      return MaterialPageRoute(builder: (context) => const LoginView());
    case RegisterView.routeName:
      return MaterialPageRoute(builder: (context) => RegisterView());
    case Root.routeName:
      return MaterialPageRoute(builder: (context) => const Root());
    case HomeView.routeName:
      return MaterialPageRoute(builder: (context) => const HomeView());
    case ProductDetailsView.routeName:
      return MaterialPageRoute(
        builder: (context) => const ProductDetailsView(productId: 1),
      );
    case CheckoutView.routeName:
      return MaterialPageRoute(builder: (context) => const CheckoutView());
    case CartView.routeName:
      return MaterialPageRoute(builder: (context) => const CartView());
    default:
      return MaterialPageRoute(
        builder: (context) => Scaffold(
          body: Center(child: Text('No route defined for ${settings.name}')),
        ),
      );
  }
}
