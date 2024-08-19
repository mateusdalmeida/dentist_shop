import 'package:flutter/material.dart';

class ProductImage extends StatelessWidget {
  final String? imageUrl;

  const ProductImage({super.key, this.imageUrl});

  final String assetImage = "assets/no_picture.png";

  @override
  Widget build(BuildContext context) {
    if (imageUrl == null) return Image.asset(assetImage);
    return Image(
      image: NetworkImage(imageUrl!),
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) {
          return child;
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
      errorBuilder: (context, error, stackTrace) {
        return Image.asset(assetImage);
      },
    );
  }
}
