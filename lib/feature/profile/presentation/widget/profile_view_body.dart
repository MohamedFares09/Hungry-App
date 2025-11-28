import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hungry_app/core/constants/app_colors.dart';
import 'package:hungry_app/core/widgets/custom_text_filed.dart';
import 'package:hungry_app/feature/profile/presentation/cubit/profile_cubit.dart';
import 'package:hungry_app/feature/profile/presentation/cubit/profile_state.dart';
import 'package:hungry_app/feature/profile/presentation/widget/profile_image.dart';

class ProfileViewBody extends StatefulWidget {
  const ProfileViewBody({super.key});

  @override
  State<ProfileViewBody> createState() => _ProfileViewBodyState();
}

class _ProfileViewBodyState extends State<ProfileViewBody> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCubit, ProfileState>(
      listener: (context, state) {
        if (state is ProfileError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
              backgroundColor: Colors.red,
              behavior: SnackBarBehavior.floating,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          );
        } else if (state is ProfileSuccess) {
          nameController.text = state.user.name;
          emailController.text = state.user.email;
        }
      },
      builder: (context, state) {
        if (state is ProfileLoading) {
          return Center(
            child: CircularProgressIndicator(
              color: Colors.white,
              strokeWidth: 3,
            ),
          );
        }

        return SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              SizedBox(height: 10),
              ProfileImage(
                imageUrl: state is ProfileSuccess ? state.user.image : null,
              ),
              SizedBox(height: 16),
              if (state is ProfileSuccess)
                Text(
                  state.user.name,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              SizedBox(height: 8),
              if (state is ProfileSuccess)
                Text(
                  state.user.email,
                  style: TextStyle(color: Colors.white70, fontSize: 14),
                ),
              SizedBox(height: 40),

              // Profile Information Section
              _buildSectionTitle('Profile Information'),
              SizedBox(height: 16),

              CustomTextFiled(
                hintText: 'Full Name',
                controller: nameController,
                fillColor: AppColors.primaryColor,
                labe: Text(
                  'Full Name',
                  style: TextStyle(color: Colors.white70, fontSize: 14),
                ),
                hintTextColor: TextStyle(color: Colors.white),
              ),
              SizedBox(height: 16),

              CustomTextFiled(
                hintText: 'Email Address',
                controller: emailController,
                fillColor: AppColors.primaryColor,
                labe: Text(
                  'Email Address',
                  style: TextStyle(color: Colors.white70, fontSize: 14),
                ),
                hintTextColor: TextStyle(color: Colors.white),
              ),

              SizedBox(height: 40),

              // Action Buttons
              _buildActionButton(
                icon: Icons.edit_outlined,
                title: 'Edit Profile',
                onTap: () {
                  // TODO: Navigate to edit profile
                },
              ),
              SizedBox(height: 12),

              _buildActionButton(
                icon: Icons.lock_outline,
                title: 'Change Password',
                onTap: () {
                  // TODO: Navigate to change password
                },
              ),
              SizedBox(height: 12),

              _buildActionButton(
                icon: Icons.logout,
                title: 'Log Out',
                color: Colors.red.shade400,
                onTap: () {
                  // TODO: Implement logout
                },
              ),

              SizedBox(height: 20),
            ],
          ),
        );
      },
    );
  }

  Widget _buildSectionTitle(String title) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        title,
        style: TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildActionButton({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    Color? color,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.1),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.white.withOpacity(0.2), width: 1),
        ),
        child: Row(
          children: [
            Icon(icon, color: color ?? Colors.white, size: 24),
            SizedBox(width: 16),
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  color: color ?? Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: (color ?? Colors.white).withOpacity(0.5),
              size: 16,
            ),
          ],
        ),
      ),
    );
  }
}
