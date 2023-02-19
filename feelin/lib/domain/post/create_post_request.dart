import 'package:json_annotation/json_annotation.dart';
import 'package:music_sns/domain/play/original_vendor_playlist.dart';
import 'package:music_sns/domain/play/playlist_preview.dart';

part 'create_post_request.g.dart';

@JsonSerializable()
class CreatePostRequest {
  @JsonKey(name: "title")
  String title;
  @JsonKey(name: "content")
  String content;
  @JsonKey(name: "playlist")
  PlaylistPreview playlistPreview;
  @JsonKey(name: "originalVendorPlaylist")
  OriginalVendorPlaylist? originalVendorPlaylist;

  CreatePostRequest({
    required this.title,
    required this.content,
    required this.playlistPreview,
    this.originalVendorPlaylist,
  });

  factory CreatePostRequest.fromJson(Map<String, dynamic> json) => _$CreatePostRequestFromJson(json);

  Map<String, dynamic> toJson() => _$CreatePostRequestToJson(this);
}
