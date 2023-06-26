import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:omega_practice/src/models/tag_list.dart';

class ImageService {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://api.imagga.com/v2',
      headers: {
        'Authorization':
            'Basic ${base64.encode(utf8.encode('acc_49a6dde218c287a:69652cac15ead5a618effaec452abadd'))}',
      },
    ),
  );

  Future<List<String>> tagImage(String imageUrl) async {
    final response = await _dio.get<Map<String, dynamic>>(
      '/tags',
      queryParameters: {
        'image_url': imageUrl,
      },
    );

    if (response.data != null) {
      final result = response.data!['result'] as Map<String, dynamic>;
      final imageTags = ImageTags.fromJson(result);
      final tags = imageTags.tags.map((tag) => tag.tag.en).toList();

      return tags;
    }

    return [];
  }
}
