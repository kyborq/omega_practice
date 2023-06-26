import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
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
      _galleryBloc.add(GalleryAddImageEvent(image.path));
    }
  }

  Future<void> _updateList() async {
    _galleryBloc.add(GalleryLoadEvent());
  }

  @override
  void initState() {
    super.initState();
    _galleryBloc = GalleryBloc();
    _galleryBloc.add(GalleryLoadEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is! Authenticated) {
          context.go(AppPages.login.toPath);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Галерея'),
          elevation: 4,
          actions: [
            IconButton(
              onPressed: () {
                BlocProvider.of<AuthBloc>(context).add(Logout());
              },
              icon: const Icon(Icons.logout),
            ),
          ],
        ),
        // body: BlocListener<GalleryBloc, GalleryState>(
        //   listener: (context, state) {},
        //   child: SafeArea(
        //     child: ImageGallery(
        //       images: _galleryBloc.state.imageUrls,
        //       onUpdate: _updateList,
        //     ),
        //   ),
        // ),
        body: BlocBuilder<GalleryBloc, GalleryState>(
          bloc: _galleryBloc,
          builder: (context, state) {
            if (state is GalleryLoaded) {
              return SafeArea(
                child: ImageGallery(
                  images: state.imageUrls,
                  onUpdate: _updateList,
                ),
              );
            }
            return const CircularProgressIndicator();
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _pickImage,
          child: const Icon(Icons.upload),
        ),
      ),
    );
  }
}
