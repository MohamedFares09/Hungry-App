import 'package:flutter/material.dart';
import 'package:hungry_app/feature/product/presentation/widget/price_section.dart';
import 'package:hungry_app/feature/profile/presentation/widget/profile_view_body.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});
  static const routeName = 'profile view';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ProfileViewBody(),
     
    );
  }
}
