import 'package:flutter/material.dart';

class ProfileImage extends StatelessWidget {
  final String? imageUrl;

  const ProfileImage({super.key, this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 120,
        width: 120,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white, width: 2),
          borderRadius: BorderRadius.circular(30),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: imageUrl != null && imageUrl!.isNotEmpty
              ? Image.network(
                  imageUrl!,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Image.asset(
                      'assets/images/profile.png',
                      fit: BoxFit.cover,
                    );
                  },
                )
              : Image.asset('assets/images/profile.png', fit: BoxFit.cover),
        ),
      ),
    );
  }
}
