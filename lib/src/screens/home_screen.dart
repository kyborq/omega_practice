import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:omega_practice/src/bloc/auth/auth_bloc.dart';
import 'package:omega_practice/src/bloc/gallery/gallery_bloc.dart';
import 'package:omega_practice/src/router/app_pages.dart';
import 'package:omega_practice/src/widgets/image_gallery.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late GalleryBloc _galleryBloc;

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      _galleryBloc.add(GalleryUpload(image.path));
    }
  }

  @override
  void initState() {
    super.initState();
    _galleryBloc = GalleryBloc();
    _galleryBloc.add(GalleryLoad());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppPages.home.toTitle),
        elevation: 4,
        actions: [
          IconButton(
            onPressed: () {
              BlocProvider.of<AuthBloc>(context).add(LogoutUser());
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: BlocBuilder<GalleryBloc, GalleryState>(
        bloc: _galleryBloc,
        builder: (context, state) {
          if (state is GalleryLoaded) {
            return ImageGallery(
              images: state.imageUrls,
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _pickImage,
        child: const Icon(Icons.upload),
      ),
    );
  }
}
