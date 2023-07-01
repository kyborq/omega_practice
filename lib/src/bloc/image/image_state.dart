part of 'image_bloc.dart';

abstract class ImageState {}

class LoadingTags extends ImageState {}

class LoadedTags extends ImageState {
  LoadedTags(this.tags);
  final List<String> tags;
}

class TagsError extends ImageState {
  TagsError(this.errorMessage);
  final String errorMessage;
}
