import 'package:flutter/material.dart';

import 'package:hungry_app/core/widgets/custom_text_filed.dart';

class ProfileEditForm extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController emailController;
  final bool isUpdating;
  final VoidCallback onCancel;
  final VoidCallback onSave;

  const ProfileEditForm({
    super.key,
    required this.nameController,
    required this.emailController,
    required this.isUpdating,
    required this.onCancel,
    required this.onSave,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextFiled(
          hintText: 'Full Name',
          controller: nameController,
          readOnly: false,
          labe: const Text('Full Name'),
        ),
        const SizedBox(height: 16),
        CustomTextFiled(
          hintText: 'Email Address',
          controller: emailController,
          readOnly: false,
          labe: const Text('Email Address'),
        ),
        SizedBox(height: 30),
        Row(
          children: [
            Expanded(
              child: ElevatedButton(
                onPressed: isUpdating ? null : onCancel,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white.withOpacity(0.2),
                  padding: EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                    side: BorderSide(color: Colors.white.withOpacity(0.3)),
                  ),
                ),
                child: Text(
                  'Cancel',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            SizedBox(width: 16),
            Expanded(
              child: ElevatedButton(
                onPressed: isUpdating ? null : onSave,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFFF7622),
                  padding: EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: isUpdating
                    ? SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(
                          color: Colors.white,
                          strokeWidth: 2,
                        ),
                      )
                    : Text(
                        'Save',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
