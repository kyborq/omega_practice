part of 'image_bloc.dart';

abstract class ImageEvent {}

class LoadTags extends ImageEvent {
  LoadTags(this.imageUrl);

  final String imageUrl;
}
