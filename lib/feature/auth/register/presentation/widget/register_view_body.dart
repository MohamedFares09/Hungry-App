import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hungry_app/core/constants/app_colors.dart';
import 'package:hungry_app/core/widgets/custom_button.dart';
import 'package:hungry_app/core/widgets/custom_text_filed.dart';
import 'package:hungry_app/feature/auth/login/presentation/login_view.dart';
import 'package:hungry_app/feature/auth/register/presentation/cubit/register_cubit.dart';
import 'package:hungry_app/feature/auth/register/presentation/cubit/register_state.dart';
import 'package:hungry_app/feature/auth/register/presentation/widget/do_you_have_an_account.dart';

class RegisterViewBody extends StatelessWidget {
  const RegisterViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<RegisterCubit>();
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is RegisterSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Register Successfully")),
          );
          Navigator.pushNamed(context, LoginView.routeName);
        }
        if (state is RegisterError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Email Already Exist'),
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
                      // Logo
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
                        "Sign Up",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: AppColors.textPrimary,
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        "Please sign up to get started",
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
                            "Name",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: AppColors.textPrimary,
                            ),
                          ),
                          const SizedBox(height: 8),
                          CustomTextFiled(
                            hintText: "John Doe",
                            controller: cubit.nameController,
                            fillColor: Colors.white,
                          ),
                          const SizedBox(height: 20),
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
                            hintText: "example@gmail.com",
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
                            hintText: "••••••••",
                            controller: cubit.passwordController,
                            obscureText: true,
                            fillColor: Colors.white,
                          ),
                        ],
                      ),

                      const SizedBox(height: 30),

                      // Register Button
                      state is RegisterLoading
                          ? const Center(
                              child: CircularProgressIndicator(
                                color: AppColors.primaryColor,
                              ),
                            )
                          : CustomButton(
                              text: 'SIGN UP',
                              backGroundColor: AppColors.primaryColor,
                              color: Colors.white,
                              width: double.infinity,
                              onTap: () {
                                if (cubit.formKey.currentState!.validate()) {
                                  cubit.register();
                                }
                              },
                            ),

                      const SizedBox(height: 30),

                      // Footer
                      DoYouHaveAnAccount(),
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
