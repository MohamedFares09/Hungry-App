import 'package:flutter/material.dart';
import 'package:hungry_app/core/functions/on_generate_route.dart';
import 'package:hungry_app/feature/splash/presentation/splash_view.dart';

void main() {
  runApp(const HungryApp());
}

class HungryApp extends StatelessWidget {
  const HungryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: onGenerateRoute,
      initialRoute: SplashView.routeName,
      debugShowCheckedModeBanner: false,
    );
  }
}
