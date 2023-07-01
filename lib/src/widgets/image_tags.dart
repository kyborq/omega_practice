import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:omega_practice/src/bloc/image/image_bloc.dart';

class ImageTags extends StatelessWidget {
  const ImageTags({required this.imageUrl, super.key});

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ImageBloc, ImageState>(
      builder: (context, state) {
        if (state is LoadedTags) {
          return Wrap(
            children: state.tags
                .map(
                  (tag) => Chip(
                    label: Text(tag),
                  ),
                )
                .toList(),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
