import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:omega_practice/src/services/gallery_service.dart';

part 'gallery_event.dart';
part 'gallery_state.dart';

class GalleryBloc extends Bloc<GalleryEvent, GalleryState> {
  GalleryBloc() : super(GalleryInitial()) {
    on<GalleryLoad>(_onGalleryLoad);
    on<GalleryUpload>(_onGalleryUpload);
  }

  final GalleryService _galleryService = GalleryService();

  FutureOr<void> _onGalleryLoad(
    GalleryLoad event,
    Emitter<GalleryState> emit,
  ) async {
    emit(GalleryLoading());

    try {
      final imageUrls = await _galleryService.getImages();
      emit(GalleryLoaded(imageUrls!));
    } on Exception {
      // ignore: avoid_print
      // print(e);
    }
  }

  FutureOr<void> _onGalleryUpload(
    GalleryUpload event,
    Emitter<GalleryState> emit,
  ) async {
    try {
      emit(GalleryLoading());
      await _galleryService.uploadImage(event.path);
      final imageUrls = await _galleryService.getImages();
      emit(GalleryLoaded(imageUrls!));
    } on Exception {
      // ignore: avoid_print
      // print(e);
    }
  }
}
