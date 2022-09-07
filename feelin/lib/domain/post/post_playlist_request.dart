import 'package:json_annotation/json_annotation.dart';

part 'post_playlist_request.g.dart';

@JsonSerializable()
class PostPlaylistRequest{
  @JsonKey(name: "playlistUrl")
  String url;

  PostPlaylistRequest({
    required this.url,
});

  factory PostPlaylistRequest.fromJson(Map<String, dynamic> json) => _$PostPlaylistRequestFromJson(json);

  Map <String, dynamic> toJson() => _$PostPlaylistRequestToJson(this);
}