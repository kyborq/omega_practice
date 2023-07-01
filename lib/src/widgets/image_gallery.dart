import 'package:flutter/material.dart';
import 'package:omega_practice/src/widgets/image_item.dart';

class ImageGallery extends StatelessWidget {
  const ImageGallery({required this.images, super.key});

  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        crossAxisCount: 2,
      ),
      itemCount: images.length,
      itemBuilder: (context, index) {
        // Item rendering
        return ImageItem(
          url: images[index],
        );
      },
    );
  }
}
