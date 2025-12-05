import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:hungry_app/core/di/di.dart';
import 'package:hungry_app/feature/auth/login/presentation/cubit/logout_cubit.dart';
import 'package:hungry_app/feature/profile/presentation/cubit/profile_cubit.dart';
import 'package:hungry_app/feature/profile/presentation/widget/profile_view_body.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});
  static const routeName = 'profile view';

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<ProfileCubit>()..getUserProfile(),
        ),
        BlocProvider(create: (context) => getIt<LogoutCubit>()),
      ],
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          centerTitle: true,
          title: const Text(
            'My Profile',
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
              size: 20,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.settings_outlined,
                color: Colors.black,
                size: 24,
              ),
            ),
          ],
        ),
        body: ProfileViewBody(),
      ),
    );
  }
}
