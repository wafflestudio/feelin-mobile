import 'package:json_annotation/json_annotation.dart';
import 'package:music_sns/domain/play/track.dart';

part 'playlist.g.dart';

@JsonSerializable()
class Playlist{
  @JsonKey(name: "id")
  int id;

  @JsonKey(name: "title")
  String title;

  @JsonKey(name: "tracks")
  List<Track> tracks;

  Playlist({
    required this.id,
    required this.title,
    required this.tracks,
  });

  factory Playlist.fromJson(Map<String, dynamic> json) => _$PlaylistFromJson(json);

  Map<String, dynamic> toJson() => _$PlaylistToJson(this);
}