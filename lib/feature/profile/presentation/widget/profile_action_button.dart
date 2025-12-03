import 'package:flutter/material.dart';

class ProfileActionButton extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback? onTap;
  final Color? color;

  const ProfileActionButton({
    super.key,
    required this.icon,
    required this.title,
    this.onTap,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
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
