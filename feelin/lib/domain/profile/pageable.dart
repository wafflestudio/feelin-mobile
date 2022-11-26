import 'package:json_annotation/json_annotation.dart';
import 'package:music_sns/domain/profile/post_thumbnail.dart';

import '../play/post.dart';

part 'pageable.g.dart';

@JsonSerializable()
class Pageable{
  @JsonKey(name: "content")
  List<Post> content;

  Pageable({
    required this.content,
  });

  factory Pageable.fromJson(Map<String, dynamic> json) => _$PageableFromJson(json);

  Map<String, dynamic> toJson() => _$PageableToJson(this);
}