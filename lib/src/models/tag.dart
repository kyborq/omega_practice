import 'package:json_annotation/json_annotation.dart';
import 'package:omega_practice/src/models/tag_data.dart';

part 'tag.g.dart';

@JsonSerializable()
class Tag {
  Tag({required this.confidence, required this.tag});

  factory Tag.fromJson(Map<String, dynamic> json) => _$TagFromJson(json);

  final double confidence;
  final TagData tag;

  Map<String, dynamic> toJson() => _$TagToJson(this);
}
