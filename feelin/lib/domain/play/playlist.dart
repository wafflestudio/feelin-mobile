import 'package:json_annotation/json_annotation.dart';
import 'package:music_sns/domain/play/playlist_preview.dart';
import 'package:music_sns/domain/play/track.dart';

import 'main_track.dart';
import 'original_vendor_playlist.dart';

part 'playlist.g.dart';

@JsonSerializable()
class Playlist{

  @JsonKey(name: 'id')
  String id;

  @JsonKey(name: "title")
  String title;

  @JsonKey(name: "tracks")
  List<Track>? tracks;

  @JsonKey(name: "preview")
  PlaylistPreview? playlistPreview;

  @JsonKey(name: "thumbnail")
  String? thumbnail;

  @JsonKey(name: "mainTracks")
  List<MainTrack>? mainTracks;

  @JsonKey(name: "originalVendorPlaylist")
  OriginalVendorPlaylist? originalVendorPlaylist;

  Playlist({
    this.id = '',
    this.title = '',
    this.tracks,
    this.playlistPreview,
    this.thumbnail,
    this.mainTracks,
    this.originalVendorPlaylist,
  });

  factory Playlist.fromJson(Map<String, dynamic> json) => _$PlaylistFromJson(json);

  Map<String, dynamic> toJson() => _$PlaylistToJson(this);
}