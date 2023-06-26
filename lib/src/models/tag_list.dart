import 'package:json_annotation/json_annotation.dart';
import 'package:omega_practice/src/models/tag.dart';

part 'tag_list.g.dart';

@JsonSerializable()
class ImageTags {
  ImageTags({required this.tags});

  factory ImageTags.fromJson(Map<String, dynamic> json) =>
      _$ImageTagsFromJson(json);

  final List<Tag> tags;
  Map<String, dynamic> toJson() => _$ImageTagsToJson(this);
}
