part of 'gallery_bloc.dart';

abstract class GalleryEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class GalleryLoadEvent extends GalleryEvent {}

class GalleryAddImageEvent extends GalleryEvent {
  GalleryAddImageEvent(this.path);

  final String path;

  @override
  List<Object> get props => [path];
}
