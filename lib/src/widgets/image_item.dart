import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:omega_practice/src/router/app_pages.dart';

class ImageItem extends StatelessWidget {
  const ImageItem({required this.url, super.key});

  final String url;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async => context.push(
        '${AppPages.image.toPath}/${Uri.encodeComponent(url)}',
      ),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.grey[100],
        ),
        child: CachedNetworkImage(
          imageUrl: url,
          fit: BoxFit.cover,
          progressIndicatorBuilder: (context, url, downloadProgress) => Center(
            child: CircularProgressIndicator(value: downloadProgress.progress),
          ),
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
      ),
    );
  }
}
