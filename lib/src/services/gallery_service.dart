import 'dart:async';
import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:omega_practice/src/services/auth_service.dart';

class GalleryService {
  final FirebaseStorage _storage = FirebaseStorage.instance;
  final AuthService _authService = AuthService();

  Future<bool> isAuthenticated() async {
    final currentUser = _authService.getCurrentUser();
    return currentUser != null;
  }

  Future<List<String>?> getImages() async {
    final currentUser = _authService.getCurrentUser();

    if (currentUser == null) {
      return null;
    }

    final uid = currentUser.uid;

    final result = await _storage.ref().child('$uid/').listAll();
    final downloadUrls = <String>[];

    for (final ref in result.items) {
      final downloadUrl = await ref.getDownloadURL();
      downloadUrls.add(downloadUrl);
    }

    return downloadUrls;
  }

  Future<String?> uploadImage(String path) async {
    final currentUser = _authService.getCurrentUser();

    if (currentUser == null) {
      return null;
    }

    final uid = currentUser.uid;
    final file = File(path);

    final fileName = DateTime.now().millisecondsSinceEpoch.toString();
    final ref = _storage.ref().child('$uid/$fileName.jpg');
    final task = ref.putFile(file);

    final snapshot = await task.whenComplete(() => null);
    final downloadUrl = await snapshot.ref.getDownloadURL();

    return downloadUrl;
  }
}
