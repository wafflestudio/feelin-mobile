import 'package:json_annotation/json_annotation.dart';

import 'album.dart';
import 'artist.dart';

part 'track.g.dart';

@JsonSerializable()
class Track{
  @JsonKey(name: "id")
  String id;

  @JsonKey(name: "title")
  String title;

  @JsonKey(name: "artists")
  List<Artist> artists;

  @JsonKey(name: "album")
  Album album;

  Track({
    required this.id,
    required this.title,
    required this.artists,
    required this.album,
  });

  factory Track.fromJson(Map<String, dynamic> json) => _$TrackFromJson(json);

  Map<String, dynamic> toJson() => _$TrackToJson(this);
}