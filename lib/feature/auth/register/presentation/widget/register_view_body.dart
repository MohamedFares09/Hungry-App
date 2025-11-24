import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hungry_app/core/constants/app_colors.dart';
import 'package:hungry_app/core/constants/app_image.dart';
import 'package:hungry_app/core/widgets/custom_button.dart';
import 'package:hungry_app/core/widgets/custom_text_filed.dart';
import 'package:hungry_app/feature/auth/register/presentation/cubit/register_cubit.dart';
import 'package:hungry_app/feature/auth/register/presentation/cubit/register_state.dart';
import 'package:hungry_app/feature/auth/register/presentation/widget/do_you_have_an_account.dart';
import 'package:hungry_app/root.dart';

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
          Navigator.pushNamed(context, Root.routeName);
        }
        if (state is RegisterError) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.error)));
        }
      },
      builder: (context, state) {
        return Form(
          key: cubit.formKey,
          child: Center(
            child: Column(
              children: [
                SizedBox(height: 250),
                SvgPicture.asset(
                  Assets.svgTextSplashImage,
                  color: AppColors.primaryColor,
                ),
                SizedBox(height: 120),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            SizedBox(height: 100),
                            CustomTextFiled(
                              hintText: "Enter Name",
                              controller: cubit.nameController,
                            ),
                            SizedBox(height: 20),
                            CustomTextFiled(
                              hintText: "Enter email",
                              controller: cubit.emailController,
                            ),
                            SizedBox(height: 20),
                            CustomTextFiled(
                              hintText: "Enter password",
                              controller: cubit.passwordController,
                              obscureText: true,
                            ),
                            SizedBox(height: 20),
                            state is RegisterLoading
                                ? const CircularProgressIndicator(
                                    color: Colors.white,
                                  )
                                : CustomButton(
                                    text: 'Register',
                                    backGroundColor: Colors.white,
                                    color: AppColors.primaryColor,
                                    width: double.infinity,
                                    onTap: () {
                                      if (cubit.formKey.currentState!
                                          .validate()) {
                                        cubit.register();
                                      }
                                    },
                                  ),
                            SizedBox(height: 20),
                            DoYouHaveAnAccount(),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
