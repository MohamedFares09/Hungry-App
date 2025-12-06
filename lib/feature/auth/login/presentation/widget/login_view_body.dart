import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hungry_app/core/constants/app_colors.dart';
import 'package:hungry_app/core/constants/app_image.dart';
import 'package:hungry_app/core/widgets/custom_button.dart';
import 'package:hungry_app/core/widgets/custom_text_filed.dart';
import 'package:hungry_app/feature/auth/login/presentation/cubit/login_cubit.dart';
import 'package:hungry_app/feature/auth/login/presentation/cubit/login_state.dart';
import 'package:hungry_app/feature/auth/login/presentation/widget/do_not_have_an_account.dart';
import 'package:hungry_app/root.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<LoginCubit>();
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccess) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(const SnackBar(content: Text("Login Successfully")));
          Navigator.pushNamedAndRemoveUntil(
            context,
            Root.routeName,
            (route) => false,
          );
        }
        if (state is LoginError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.error),
              backgroundColor: AppColors.error,
            ),
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: AppColors.backgroundColor,
          body: SafeArea(
            child: Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Form(
                  key: cubit.formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Logo,
                      const Text(
                        "Burger Hub",
                        style: TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primaryColor,
                          fontFamily: 'LuckiestGuy',
                        ),
                      ),
                      const SizedBox(height: 40),

                      // Welcome Text
                      const Text(
                        "Log In",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: AppColors.textPrimary,
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        "Please sign in to your existing account",
                        style: TextStyle(
                          fontSize: 16,
                          color: AppColors.textSecondary,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 40),

                      // Inputs
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Email",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: AppColors.textPrimary,
                            ),
                          ),
                          const SizedBox(height: 8),
                          CustomTextFiled(
                            hintText: 'example@gmail.com',
                            controller: cubit.emailController,
                            fillColor: Colors.white,
                          ),
                          const SizedBox(height: 20),
                          const Text(
                            "Password",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: AppColors.textPrimary,
                            ),
                          ),
                          const SizedBox(height: 8),
                          CustomTextFiled(
                            obscureText: true,
                            hintText: '••••••••',
                            controller: cubit.passwordController,
                            fillColor: Colors.white,
                          ),
                        ],
                      ),

                      const SizedBox(height: 30),

                      // Login Button
                      BlocBuilder<LoginCubit, LoginState>(
                        builder: (context, state) {
                          if (state is LoginLoading) {
                            return const Center(
                              child: CircularProgressIndicator(
                                color: AppColors.primaryColor,
                              ),
                            );
                          }
                          return CustomButton(
                            text: "LOG IN",
                            backGroundColor: AppColors.primaryColor,
                            color: Colors.white,
                            onTap: () {
                              if (cubit.formKey.currentState!.validate()) {
                                cubit.login();
                              }
                            },
                            width: double.infinity,
                          );
                        },
                      ),

                      const SizedBox(height: 30),

                      // Footer
                      const DoNoHaveAnAccount(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
