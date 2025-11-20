import 'package:flutter/material.dart';
import 'package:hungry_app/core/constants/app_colors.dart';
import 'package:hungry_app/core/constants/app_styles.dart';
import 'package:hungry_app/core/widgets/custom_text_filed.dart';
import 'package:hungry_app/feature/check_out/presentation/widget/select_payment.dart';
import 'package:hungry_app/feature/profile/presentation/widget/custom_button_profile_view.dart';
import 'package:hungry_app/feature/profile/presentation/widget/profile_image.dart';

class ProfileViewBody extends StatefulWidget {
  const ProfileViewBody({super.key});

  @override
  State<ProfileViewBody> createState() => _ProfileViewBodyState();
}

class _ProfileViewBodyState extends State<ProfileViewBody> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final addressController = TextEditingController();
  final passwordController = TextEditingController();
  String selectedPayment = 'visa';
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            ProfileImage(),
            SizedBox(height: 35),
            CustomTextFiled(
              hintText: 'Name',
              controller: nameController,
              fillColor: AppColors.primaryColor,
              labe: Text(
                'Name',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              hintTextColor: TextStyle(color: Colors.white),
            ),
            SizedBox(height: 15),
            CustomTextFiled(
              hintText: 'Email',
              controller: emailController,
              fillColor: AppColors.primaryColor,
              labe: Text(
                'Email',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              hintTextColor: TextStyle(color: Colors.white),
            ),

            SizedBox(height: 15),
            CustomTextFiled(
              hintText: 'Address',
              controller: addressController,
              fillColor: AppColors.primaryColor,
              labe: Text(
                'Address',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              hintTextColor: TextStyle(color: Colors.white),
            ),

            SizedBox(height: 15),
            CustomTextFiled(
              hintText: 'Password',
              controller: passwordController,
              fillColor: AppColors.primaryColor,
              labe: Text(
                'Password',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              hintTextColor: TextStyle(color: Colors.white),
            ),

            SizedBox(height: 15),
            Divider(color: Colors.white),
            SizedBox(height: 15),
            SelectPayment(
              onTap: () {
                setState(() {
                  selectedPayment = 'visa';
                });
              },
              titleStyle: AppStyles.mediam18.copyWith(color: Colors.black),
              tileColor: Colors.white,
              title: 'Debit card',
              subTitle: Text(
                '3566 **** **** 0505',
                style: AppStyles.mediam18.copyWith(color: Color(0xff808080)),
              ),
              image: 'assets/images/visa.png',
              color: AppColors.primaryColor,
              value: 'visa',
              groupValue: selectedPayment,
              onChanged: (value) {
                setState(() => selectedPayment = value!);
              },
            ),

            Row(
              children: [
                CustomButtonProfileView(
                  titleColor: AppColors.primaryColor,
                  title: 'Edit Profile',
                  backgroundColor: Colors.white,
                  icon: Icons.edit_document,
                ),
                CustomButtonProfileView(
                  titleColor: Colors.white,
                  title: 'Log out',
                  backgroundColor: AppColors.primaryColor,
                  icon: Icons.logout,
                  iconColor: Colors.white,
                ),
              ],
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
