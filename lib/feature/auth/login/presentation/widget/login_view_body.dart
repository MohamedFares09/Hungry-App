import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hungry_app/core/constants/app_colors.dart';
import 'package:hungry_app/core/constants/app_image.dart';
import 'package:hungry_app/core/widgets/custom_button.dart';
import 'package:hungry_app/core/widgets/custom_text_filed.dart';
import 'package:hungry_app/feature/auth/login/presentation/widget/do_not_have_an_account.dart';
import 'package:hungry_app/root.dart';

class LoginViewBody extends StatelessWidget {
  LoginViewBody({super.key});
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Form(
        key: formKey,
        child: Column(
          children: [
            SizedBox(height: 100),
            SvgPicture.asset(Assets.svgTextSplashImage),
            SizedBox(height: 20),
            Text(
              "Welcome Back to Hungry App",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 100),
            CustomTextFiled(hintText: 'Email', controller: emailController),
            SizedBox(height: 20),
            CustomTextFiled(
              obscureText: true,
              hintText: 'Password',
              controller: passwordController,
            ),
            SizedBox(height: 16),
            CustomButton(
              text: "Login",
              backGroundColor: Colors.white,
              color: AppColors.primaryColor,
              onTap: () {
                if (formKey.currentState!.validate()) {
                  Navigator.pushReplacementNamed(context, Root.routeName);
                }
              },
              width: double.infinity,
            ),
            SizedBox(height: 30),
            DoNoHaveAnAccount(),
          ],
        ),
      ),
    );
  }
}
