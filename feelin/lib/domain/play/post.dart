import 'package:json_annotation/json_annotation.dart';
import 'package:music_sns/domain/play/playlist.dart';

part 'post.g.dart';

@JsonSerializable()
class Post{
  @JsonKey(name:"id")
  String id;

  @JsonKey(name:"writer")
  String writer;

  @JsonKey(name:"profile")
  String profile;

  @JsonKey(name:"content")
  String content;

  @JsonKey(name:"playlist")
  Playlist playlist;

  Post({
    required this.id,
    required this.writer,
    required this.profile,
    required this.content,
    required this.playlist,
  });

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);

  Map<String, dynamic> toJson() => _$PostToJson(this);
}