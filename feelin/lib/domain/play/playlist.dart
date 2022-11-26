import 'package:json_annotation/json_annotation.dart';
import 'package:music_sns/domain/play/playlist_preview.dart';
import 'package:music_sns/domain/play/track.dart';

part 'playlist.g.dart';

@JsonSerializable()
class Playlist{

  @JsonKey(name: "title")
  String title;

  @JsonKey(name: "tracks")
  List<Track>? tracks;

  @JsonKey(name: "preview")
  PlaylistPreview? playlistPreview;

  @JsonKey(name: "thumbnail")
  String? thumbnail;

  Playlist({
    this.title = '',
    this.tracks,
    this.playlistPreview,
    this.thumbnail,
  });

  factory Playlist.fromJson(Map<String, dynamic> json) => _$PlaylistFromJson(json);

  Map<String, dynamic> toJson() => _$PlaylistToJson(this);
}