part of 'gallery_bloc.dart';

abstract class GalleryEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class GalleryLoad extends GalleryEvent {}

class GalleryUpload extends GalleryEvent {
  GalleryUpload(this.path);

  final String path;

  @override
  List<Object> get props => [path];
}
