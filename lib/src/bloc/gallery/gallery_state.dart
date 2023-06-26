part of 'gallery_bloc.dart';

abstract class GalleryState extends Equatable {
  const GalleryState();

  @override
  List<Object> get props => [];
}

class GalleryInitial extends GalleryState {}

class GalleryLoading extends GalleryState {}

class GalleryLoaded extends GalleryState {
  const GalleryLoaded(this.imageUrls);

  final List<String> imageUrls;

  @override
  List<Object> get props => [imageUrls];
}

class GalleryError extends GalleryState {
  const GalleryError(this.message);

  final String message;

  @override
  List<Object> get props => [message];
}
