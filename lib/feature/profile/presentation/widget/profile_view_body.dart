import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hungry_app/feature/profile/presentation/cubit/profile_cubit.dart';
import 'package:hungry_app/feature/profile/presentation/cubit/profile_state.dart';
import 'package:hungry_app/feature/profile/presentation/widget/profile_action_button.dart';
import 'package:hungry_app/feature/profile/presentation/widget/profile_edit_form.dart';
import 'package:hungry_app/feature/profile/presentation/widget/profile_header.dart';
import 'package:hungry_app/feature/profile/presentation/widget/profile_image.dart';
import 'package:hungry_app/feature/profile/presentation/widget/profile_section_title.dart';

class ProfileViewBody extends StatefulWidget {
  const ProfileViewBody({super.key});

  @override
  State<ProfileViewBody> createState() => _ProfileViewBodyState();
}

class _ProfileViewBodyState extends State<ProfileViewBody> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  bool isEditMode = false;
  File? selectedImage;
  String? originalName;
  String? originalEmail;

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    super.dispose();
  }

  void _toggleEditMode() {
    setState(() {
      if (isEditMode) {
        nameController.text = originalName ?? '';
        emailController.text = originalEmail ?? '';
        selectedImage = null;
      }
      isEditMode = !isEditMode;
    });
  }

  void _saveProfile() {
    if (!_validateInputs()) return;

    context.read<ProfileCubit>().updateUserProfile(
      name: nameController.text.trim(),
      email: emailController.text.trim(),
      imagePath: selectedImage?.path,
    );
  }

  bool _validateInputs() {
    if (nameController.text.trim().isEmpty) {
      _showErrorSnackBar('Please enter your name');
      return false;
    }

    if (emailController.text.trim().isEmpty) {
      _showErrorSnackBar('Please enter your email');
      return false;
    }

    return true;
  }

  void _showErrorSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), backgroundColor: Colors.red),
    );
  }

  void _showSuccessSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), backgroundColor: Colors.green),
    );
  }

  void _handleProfileSuccess(ProfileSuccess state) {
    if (!isEditMode) {
      nameController.text = state.user.name;
      emailController.text = state.user.email;
      originalName = state.user.name;
      originalEmail = state.user.email;
    }
  }

  void _handleProfileUpdateSuccess(ProfileUpdateSuccess state) {
    nameController.text = state.user.name;
    emailController.text = state.user.email;
    originalName = state.user.name;
    originalEmail = state.user.email;

    setState(() {
      selectedImage = null;
      isEditMode = false;
    });

    _showSuccessSnackBar('Profile updated successfully');

    Future.delayed(Duration(milliseconds: 500), () {
      context.read<ProfileCubit>().getUserProfile();
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCubit, ProfileState>(
      listener: (context, state) {
        if (state is ProfileError) {
          _showErrorSnackBar(state.message);
        } else if (state is ProfileSuccess) {
          _handleProfileSuccess(state);
        } else if (state is ProfileUpdateSuccess) {
          _handleProfileUpdateSuccess(state);
        } else if (state is ProfileUpdateError) {
          _showErrorSnackBar(state.message);
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

        final isUpdating = state is ProfileUpdating;

        return SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              SizedBox(height: 10),
              ProfileImage(
                imageUrl: state is ProfileSuccess ? state.user.image : null,
                selectedImage: selectedImage,
                isEditable: isEditMode,
                onImageSelected: (image) {
                  setState(() {
                    selectedImage = image;
                  });
                },
              ),
              SizedBox(height: 16),
              if (state is ProfileSuccess && !isEditMode)
                ProfileHeader(name: state.user.name, email: state.user.email),
              SizedBox(height: 40),

              if (isEditMode) ...[
                ProfileSectionTitle(title: 'Edit Profile Information'),
                SizedBox(height: 16),
                ProfileEditForm(
                  nameController: nameController,
                  emailController: emailController,
                  isUpdating: isUpdating,
                  onCancel: _toggleEditMode,
                  onSave: _saveProfile,
                ),
              ] else ...[
                ProfileActionButton(
                  icon: Icons.edit_outlined,
                  title: 'Edit Profile',
                  onTap: _toggleEditMode,
                ),
                SizedBox(height: 12),
                ProfileActionButton(
                  icon: Icons.logout,
                  title: 'Log Out',
                  color: Colors.red.shade400,
                  onTap: () {
                    
                  },
                ),
              ],
              SizedBox(height: 20),
            ],
          ),
        );
      },
    );
  }
}
