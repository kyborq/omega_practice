// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tag_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ImageTags _$ImageTagsFromJson(Map<String, dynamic> json) => ImageTags(
      tags: (json['tags'] as List<dynamic>)
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ImageTagsToJson(ImageTags instance) => <String, dynamic>{
      'tags': instance.tags,
    };
