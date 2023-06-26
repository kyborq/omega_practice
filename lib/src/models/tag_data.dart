import 'package:json_annotation/json_annotation.dart';

part 'tag_data.g.dart';

@JsonSerializable()
class TagData {
  TagData({required this.en});

  factory TagData.fromJson(Map<String, dynamic> json) =>
      _$TagDataFromJson(json);

  final String en;

  Map<String, dynamic> toJson() => _$TagDataToJson(this);
}
