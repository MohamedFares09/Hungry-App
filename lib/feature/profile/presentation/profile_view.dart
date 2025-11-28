import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hungry_app/core/constants/app_colors.dart';
import 'package:hungry_app/core/di/di.dart';
import 'package:hungry_app/feature/profile/presentation/cubit/profile_cubit.dart';
import 'package:hungry_app/feature/profile/presentation/widget/profile_view_body.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});
  static const routeName = 'profile view';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ProfileCubit>()..getUserProfile(),
      child: Scaffold(
        backgroundColor: AppColors.primaryColor,
        appBar: AppBar(
          backgroundColor: AppColors.primaryColor,
          leading: Icon(Icons.arrow_back, color: Colors.white),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.settings, color: Colors.white),
            ),
          ],
        ),
        body: ProfileViewBody(),
      ),
    );
  }
}
