import 'package:json_annotation/json_annotation.dart';

part 'post_thumbnail.g.dart';

@JsonSerializable()
class PostThumbnail{
  @JsonKey(name: "thumbnail")
  String thumbnail;

  PostThumbnail({
    required this.thumbnail,
  });

  factory PostThumbnail.fromJson(Map<String, dynamic> json) => _$PostThumbnailFromJson(json);

  Map<String, dynamic> toJson() => _$PostThumbnailToJson(this);
}