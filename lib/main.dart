import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hungry_app/core/di/di.dart';
import 'package:hungry_app/core/functions/on_generate_route.dart';
import 'package:hungry_app/feature/splash/presentation/splash_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  // Initialize GetIt Service Locator (includes CacheHelper setup)
  await setupServiceLocator();

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
