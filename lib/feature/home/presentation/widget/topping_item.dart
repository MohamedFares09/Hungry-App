import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ToppingItem extends StatelessWidget {
  const ToppingItem({
    super.key,
    required this.name,
    required this.image,
    required this.id,
    this.isSelected = false,
    this.onTap,
  });

  final int id;
  final String name, image;
  final bool isSelected;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(left: 16, right: 15),
        child: Container(
          width: 120,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            border: isSelected
                ? Border.all(color: Colors.pinkAccent, width: 3)
                : null,
            boxShadow: [
              BoxShadow(
                color: isSelected
                    ? Colors.pinkAccent.withOpacity(0.3)
                    : Colors.black12,
                blurRadius: isSelected ? 10 : 6,
                offset: Offset(1, 5),
              ),
            ],
          ),
          child: Column(
            children: [
              // الصورة
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                child: CachedNetworkImage(
                  imageUrl: image,
                  height: 80,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => Container(
                    height: 80,
                    color: Colors.grey[200],
                    child: Center(
                      child: CircularProgressIndicator(strokeWidth: 2),
                    ),
                  ),
                  errorWidget: (context, url, error) => Container(
                    height: 80,
                    color: Colors.grey[200],
                    child: Icon(Icons.error, size: 30),
                  ),
                ),
              ),

              // الجزء السفلي البني
              Container(
                decoration: BoxDecoration(
                  color: Color(0xff3C2F2F),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 8,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        name,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: isSelected ? Colors.green : Colors.pinkAccent,
                        shape: BoxShape.circle,
                      ),
                      padding: EdgeInsets.all(4),
                      child: Icon(
                        isSelected ? Icons.check : Icons.add,
                        color: Colors.white,
                        size: 18,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
