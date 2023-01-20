import 'package:json_annotation/json_annotation.dart';
import 'package:music_sns/domain/play/playlist_preview.dart';

part 'create_post_request.g.dart';

@JsonSerializable()
class CreatePostRequest{
  @JsonKey(name: "title")
  String title;
  @JsonKey(name: "content")
  String content;
  @JsonKey(name: "playlist")
  PlaylistPreview playlistPreview;

  CreatePostRequest({
    required this.title,
    required this.content,
    required this.playlistPreview,
  });

  factory CreatePostRequest.fromJson(Map<String, dynamic> json) => _$CreatePostRequestFromJson(json);

  Map <String, dynamic> toJson() => _$CreatePostRequestToJson(this);
}