part of 'image_bloc.dart';

abstract class ImageEvent {}

class LoadImageTagsEvent extends ImageEvent {
  LoadImageTagsEvent(this.imageUrl);

  final String imageUrl;
}
