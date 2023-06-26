import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:omega_practice/src/services/image_service.dart';

part 'image_event.dart';
part 'image_state.dart';

class ImageBloc extends Bloc<ImageEvent, ImageState> {
  ImageBloc() : super(ImageLoadingState()) {
    on<LoadImageTagsEvent>(_getImageTags);
  }

  final ImageService _imageService = ImageService();

  FutureOr<void> _getImageTags(
    LoadImageTagsEvent event,
    Emitter<ImageState> emit,
  ) async {
    emit(ImageLoadingState());

    try {
      final tags = await _imageService.tagImage(event.imageUrl);
      emit(ImageLoadedState(tags));
    } on Exception catch (e) {
      emit(ImageErrorState(e.toString()));
    }
  }
}
