part of 'image_bloc.dart';

abstract class ImageState {}

class ImageLoadingState extends ImageState {}

class ImageLoadedState extends ImageState {
  ImageLoadedState(this.tags);
  final List<String> tags;
}

class ImageErrorState extends ImageState {
  ImageErrorState(this.errorMessage);
  final String errorMessage;
}
