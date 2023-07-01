import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:omega_practice/src/services/image_service.dart';

part 'image_event.dart';
part 'image_state.dart';

class ImageBloc extends Bloc<ImageEvent, ImageState> {
  ImageBloc() : super(LoadingTags()) {
    on<LoadTags>(_getImageTags);
  }

  final ImageService _imageService = ImageService();

  FutureOr<void> _getImageTags(
    LoadTags event,
    Emitter<ImageState> emit,
  ) async {
    emit(LoadingTags());

    try {
      final tags = await _imageService.tagImage(event.imageUrl);
      emit(LoadedTags(tags));
    } on Exception catch (e) {
      emit(TagsError(e.toString()));
    }
  }
}
