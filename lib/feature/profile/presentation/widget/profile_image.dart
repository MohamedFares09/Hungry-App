import 'package:flutter/material.dart';

class ProfileImage extends StatelessWidget {
  final String? imageUrl;

  const ProfileImage({super.key, this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          Container(
            height: 140,
            width: 140,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white, width: 3),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 10,
                  offset: Offset(0, 5),
                ),
              ],
            ),
            child: ClipOval(
              child: imageUrl != null && imageUrl!.isNotEmpty
                  ? Image.network(
                      imageUrl!,
                      fit: BoxFit.cover,
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) return child;
                        return Center(
                          child: CircularProgressIndicator(
                            color: Colors.white,
                            value: loadingProgress.expectedTotalBytes != null
                                ? loadingProgress.cumulativeBytesLoaded /
                                      loadingProgress.expectedTotalBytes!
                                : null,
                          ),
                        );
                      },
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
          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 2),
              ),
              child: Icon(Icons.camera_alt, color: Color(0xFFFF7622), size: 20),
            ),
          ),
        ],
      ),
    );
  }
}
