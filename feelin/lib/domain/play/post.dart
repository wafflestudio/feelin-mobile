import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:music_sns/domain/play/playlist.dart';

import '../profile/profile.dart';

part 'post.g.dart';

@JsonSerializable()
class Post{
  @JsonKey(name:"id")
  int id;

  @JsonKey(name:"user")
  Profile? writer;

  @JsonKey(name:"title")
  String title;

  @JsonKey(name:"content")
  String content;

  @JsonKey(name:"playlist")
  Playlist playlist;

  @JsonKey(name:"doesLike")
  bool? isLiked;

  @JsonKey(name:"likes")
  int? likeCount;

  Post({
    required this.id,
    this.writer,
    required this.title,
    required this.content,
    required this.playlist,
    this.isLiked,
    this.likeCount = 0,
  });

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);

  Map<String, dynamic> toJson() => _$PostToJson(this);

  Post clone(){
    final jsonResponse = json.decode(json.encode(this));
        return Post.fromJson(jsonResponse as Map<String, dynamic>);
  }
}